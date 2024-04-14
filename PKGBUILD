# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-resources-monitor-git
_gitpkgname=plasma-applet-resources-monitor
pkgver=3.0.0.rc.1.r0.ga5cf7ce
pkgrel=1
pkgdesc='Plasmoid for monitoring CPU, memory, network traffic, GPUs and disks IO'
arch=(any)
url=https://github.com/orblazer/plasma-applet-resources-monitor
license=(GPL-3.0-or-later)
depends=(
    kitemmodels
    kquickcharts
    libksysguard
    libplasma
    plasma5support
)
optdepends=(
    "kdeplasma-addons: to support easier click action"
)
makedepends=(git)
conflicts=(
    plasma5-applets-resources-monitor-git
    plasma6-applets-resources-monitor
)
source=($_gitpkgname::git+https://github.com/orblazer/${_gitpkgname})
b2sums=(SKIP)

pkgver() {
    cd $_gitpkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# TODO: change to cmake when upstream porting to Plasma 6
package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
}
