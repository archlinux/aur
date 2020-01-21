# Maintainer: Alejandro Valdes <alejandro valdes at live dot com>

_pkgbase=Nordic
pkgbase=nordic-kde-git
pkgname=(nordic-kde-git kvantum-theme-nordic-git)
pkgver=1.6.5.r34.gf0d3dc4
pkgrel=1
pkgdesc="Theme for KDE Plasma 5 using the awesome Nord color pallete"
arch=(any)
url="https://github.com/EliverLara/${_pkgbase}"
license=(GPL3)
options=(!strip)
source=("git+${url}.git"
        "git+${url}-kde.git")
sha256sums=(SKIP SKIP)

pkgver() {
  cd ${_pkgbase}
  git describe --long --tags | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_nordic-kde-git() {
    optdepends=('nordic-theme-git: Matching GTK theme'
                'kvantum-theme-nordic: Nordic theme for Kvantum Qt style (recommended)')
    provides=(nordic-kde)

    cd ${_pkgbase}/kde
    install -d "${pkgdir}"/usr/share
    cp -r aurorae "${pkgdir}"/usr/share
    mkdir -p "${pkgdir}"/usr/share/color-schemes
    cp -r colorschemes/* "${pkgdir}"/usr/share/color-schemes
    cp -r konsole "${pkgdir}"/usr/share
    cd ../../${_pkgbase}-kde
    rm -r LICENSE
    mkdir -p "${pkgdir}"/usr/share/plasma/desktoptheme/Nordic
    cp -r * "${pkgdir}"/usr/share/plasma/desktoptheme/Nordic
}

package_kvantum-theme-nordic-git() {
    pkgdesc="Nordic theme for KDE Plasma 5"
    depends=(kvantum-qt5)
    provides=(kvantum-theme-nordic)

    cd ${_pkgbase}/kde
    install -d "${pkgdir}"/usr/share
    mkdir -p "${pkgdir}"/usr/share/Kvantum
    cp -r kvantum/* "${pkgdir}"/usr/share/Kvantum
}

