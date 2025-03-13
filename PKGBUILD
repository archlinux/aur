# Maintainer: Your Name <your.email@example.com>

pkgname=better-control  # Renamed from better-control-git
pkgver=0.r2dab8b5
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL-3.0-only')
depends=('gtk4' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-pydbus' 'python')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"

    # Install the main executable
    install -Dm755 src/control.py "$pkgdir/usr/bin/control"

    # Install the desktop entry
    install -Dm644 src/control.desktop "$pkgdir/usr/share/applications/control.desktop"
}

