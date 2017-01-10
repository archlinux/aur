# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cotton-git
pkgver=r79.ab0fe94
pkgrel=1
pkgdesc="A process sandbox written in C++ "
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/algorithm-ninja/cotton.git"
license=('APACHE2')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'git')
options=()
source=("git+https://github.com/algorithm-ninja/cotton.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/cotton"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/cotton"
    git submodule update --init
}

build() {
    cd "$srcdir/cotton/build"
    cmake ..
    make
}

package() {
    cd "$srcdir/cotton/build"
    install -Dm755 cotton "$pkgdir/usr/bin/cotton"
    chmod +s "$pkgdir/usr/bin/cotton"
}
