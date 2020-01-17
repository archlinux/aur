pkgname=kakoune-extra-filetypes-git
pkgver=r18_5a29ba9
pkgrel=1
pkgdesc='Extra highlighters for the Kakoune editor'
arch=('any')
url='https://github.com/kakoune-editor/kakoune-extra-filetypes'
license=('custom:unlicense')
depends=('kakoune')
makedepends=('git')
source=("${pkgname}::git+https://github.com/kakoune-editor/kakoune-extra-filetypes.git")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf r%s_%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX=/usr
    install -Dm644 UNLICENSE ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE
}
