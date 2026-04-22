# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=cockpit-pacman-git
pkgver=0.3.5.r0.ga3210e9
pkgrel=2
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-or-later')
depends=('cockpit' 'pacman')
makedepends=('npm' 'rust' 'cargo' 'git')
provides=("cockpit-pacman=${pkgver%%.r*}")
conflicts=('cockpit-pacman')
options=(!lto !debug)
source=("$pkgname::git+https://github.com/pfeifferj/cockpit-pacman.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgname"
    make build
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
