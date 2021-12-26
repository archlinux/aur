pkgname=trellium-kde-git
_pkgname=trellium
pkgver=r123.73603b69
pkgrel=1
pkgdesc="A theme suite for LXQt/KDE (Aurorae/Kvantum/LXQt/Plasma/sddm/xfwm4)"
arch=(any)
url="https://www.opencode.net/abgr/${_pkgname}"
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

package_trellium-kde-git() {
    provides=("trellium-kde")

    cd $_pkgname

    install -d "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/usr/share/Kvantum"
    mkdir -p "${pkgdir}/usr/share/aurorae/themes"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
    mkdir -p "${pkgdir}/usr/share/sddm/themes"

    cp -r kvantum/!(Trellium.source) "${pkgdir}/usr/share/Kvantum/"
    cp -r aurorae/!(Trellium.source) "${pkgdir}/usr/share/aurorae/themes/"
    cp -r plasma/!(Trellium.source) "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r sddm/!(Trellium.source) "${pkgdir}/usr/share/sddm/themes/"
}
