# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
_gitname="hyprcursor_dracula_kde"
pkgname="hyprcursor-dracula-kde-git"
pkgver=r12.d9a87d6
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

    hyprcursor-util --create . -o .
    mv theme_Dracula hyprcursor_Dracula

    install -dm755 "${pkgdir}/usr/share/icons/hyprcursor_Dracula"

    cp -r --no-preserve=ownership \
        hyprcursor_Dracula/* \
        "$pkgdir/usr/share/icons/hyprcursor_Dracula"
}
