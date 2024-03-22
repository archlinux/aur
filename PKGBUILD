# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
_gitname="hyprcursor_dracula_kde"
pkgname="hyprcursor-dracula-kde-git"
pkgver=r8.5a6eebb
pkgrel=1
pkgdesc="A Hyprcursor imported from the Dracula KDE XCursor."
arch=('any')
url="https://github.com/guillaumeboehm/${_gitname}"
license=('GPL3')
makedepends=('git' 'tar')
depends=('hyprcursor')
source=("${_gitname}::git+${url}.git")
provides=("${pkgname}")
conflicts=("${pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}" || return

    tar zxvf hyprcursor_Dracula.tar.gz

    mkdir -p "${pkgdir}/usr/share/icons"
    cp -r --no-preserve=ownership \
        hyprcursor_Dracula \
        "$pkgdir/usr/share/icons/hyprcursor_Dracula"
    chown -R 644 "$pkgdir/usr/share/icons/hyprcursor_Dracula"
}
