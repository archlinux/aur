# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=dwarview-git
_gitname=dwarview
pkgver=r31.3019f3b
pkgrel=1
pkgdesc="GUI program that displays DWARF debug info of a file"
arch=('i686' 'x86_64')
url="https://github.com/namhyung/dwarview.git"
license=('GPL')
depends=('libelf' 'gtk3')
makedepends=('git')
source=(git+https://github.com/namhyung/dwarview.git
        gladefile_path.patch)
sha1sums=('SKIP'
          '0cecc3d6baecea5b980870b9c27e0fc0bf1072dd')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    patch -p1 < ../gladefile_path.patch
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm755 dwarview "${pkgdir}/usr/bin/dwarview"
    install -Dm644 dwarview.glade "${pkgdir}/usr/share/${_gitname}/dwarview.glade"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
