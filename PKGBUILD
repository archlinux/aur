# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=cockpit-pacman-git
pkgver=0.3.7.r70.g82bd6f8
pkgrel=3
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-or-later')
depends=('cockpit' 'gcc-libs' 'glibc' 'libalpm.so' 'pacman')
makedepends=('npm' 'rust' 'cargo' 'git')
provides=("cockpit-pacman=${pkgver%%.r*}")
conflicts=('cockpit-pacman')
options=(!lto)
source=("git+https://github.com/pfeifferj/cockpit-pacman.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "${pkgname%-git}"
    make build
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
