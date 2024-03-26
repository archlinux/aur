# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-resources-monitor-git
_gitpkgname=plasma-applet-resources-monitor
pkgver=2.11.1.r18.ga26ad58
pkgrel=2
pkgdesc='A Plasma 6 applet for monitoring CPU, RAM and network traffic'
arch=(any)
url=https://github.com/orblazer/plasma-applet-resources-monitor
license=(GPL-3.0-only)
depends=(
    kitemmodels
    kquickcharts
    libksysguard
    libplasma
    plasma5support
)
makedepends=(git)
conflicts=(
    plasma5-applets-resources-monitor-git
    plasma6-applets-resources-monitor
)
source=($_gitpkgname::git+https://github.com/orblazer/${_gitpkgname}#branch=release-3.0)
b2sums=(SKIP)

pkgver() {
    cd $_gitpkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# TODO: change to cmake when upstream porting to Plasma 6
package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir/usr/share/plasma/plasmoids/org.kde.resourcesMonitor-fork/"
    cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/org.kde.resourcesMonitor-fork/"
}
