# Maintainer: Matthew Lyon <matthew@lyon.systems>
pkgname=tired-git
pkgver=9f0cce9
pkgrel=1
pkgdesc="A screen dimmer for Wayland, replicating macOS grace period and sleep dimming"
arch=('x86_64')
url="https://github.com/matthewishere/tired"
license=('MIT')
depends=('wayland' 'wayland-protocols' 'cmake' 'gcc' 'glibc' 'make')  # Required dependencies
makedepends=('git')
provides=('tired')
conflicts=('tired')

source=("git+https://github.com/matthewishere/tired.git")
sha256sums=('SKIP')  # Use 'SKIP' because we're cloning from Git

pkgver() {
    cd tired
    git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
    cd tired
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd tired/build
    make DESTDIR="$pkgdir" install
}

