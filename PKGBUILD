# Maintainer: Shi Liang <shiliang2008@msn.com>

pkgname=graphite-kde-theme-git
_reponame='Graphite-kde-theme'
pkgver=2021.12.19.r2.g6dca52d
pkgrel=1
pkgdesc='Graphite kde theme'
arch=("any")
provides=("graphite-kde-theme")
conflicts=("graphite-kde-theme")
url="https://github.com/vinceliuice/${_reponame}"
license=("GPL2")
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip)

pkgver(){
    cd "${srcdir}/${_reponame}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_reponame}"
    
    mkdir -p "${pkgdir}/usr/share/"{aurorae/themes,color-schemes,plasma/desktoptheme,plasma/look-and-feel,Kvantum,backgrounds}

    _AURORAE_DIR="${pkgdir}/usr/share/aurorae/themes"
    _SCHEMES_DIR="${pkgdir}/usr/share/color-schemes"
    _PLASMA_DIR="${pkgdir}/usr/share/plasma/desktoptheme"
    _LOOKFEEL_DIR="${pkgdir}/usr/share/plasma/look-and-feel"
    _KVANTUM_DIR="${pkgdir}/usr/share/Kvantum"
    _WALLPAPER_DIR="${pkgdir}/usr/share/backgrounds"
    
    cp -r aurorae/* ${_AURORAE_DIR}
    cp -r color-schemes/*.colors ${_SCHEMES_DIR}
    cp -r Kvantum/* ${_KVANTUM_DIR}
    cp -r plasma/desktoptheme/* ${_PLASMA_DIR}
    cp -r plasma/desktoptheme/* ${_PLASMA_DIR}
    cp -r plasma/desktoptheme/* ${_PLASMA_DIR}
    cp color-schemes/GraphiteDark.colors ${_PLASMA_DIR}/Graphite-dark/colors
    cp color-schemes/GraphiteLight.colors ${_PLASMA_DIR}/Graphite-light/colors
    cp -r plasma/look-and-feel/* ${_LOOKFEEL_DIR}
    cp -r wallpaper/* ${_WALLPAPER_DIR}

    cd sddm
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -ur Graphite "${pkgdir}/usr/share/sddm/themes"
}
