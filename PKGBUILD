pkgname=reactionary-kde-git
_pkgname=Reactionary
pkgver=r98.30bce99
pkgrel=1
pkgdesc="ReactOS-like theme for KDE Plasma"
arch=(any)
url="https://github.com/phobi4n/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

shopt -s extglob

package_reactionary-kde-git() {
    provides=('reactionary-kde')
    optdepends=('memphis98-icon-theme: Matching icon theme')

    cd $_pkgname

    install -d "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/usr/share/aurorae"
    mkdir -p "${pkgdir}/usr/share/plasma"
    mkdir -p "${pkgdir}/usr/share/color-schemes"

    cp -r desktoptheme "${pkgdir}/usr/share/plasma/"
    cp -r look-and-feel "${pkgdir}/usr/share/plasma/"
    cp -r themes "${pkgdir}/usr/share/aurorae/"
    cp -r *(*.colors) "${pkgdir}/usr/share/color-schemes/"
}
