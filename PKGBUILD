# Maintainer: Jonathan Matta <mattajonathan1@gmail.com>
pkgname='laser-git'
pkgver=0.0.0
pkgrel=1
pkgdesc="The better ls command, configurable with lua"
arch=('x86_64')
url="https://github.com/jmattaa/laser"
license=('MIT')
depends=('lua' 'glibc')
makedepends=('cmake' 'git')
source=('laser::git+https://github.com/jmattaa/laser.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/laser"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/laser"
    mkdir -p build
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/laser"
    install -Dm755 build/lsr "$pkgdir/usr/bin/lsr"
}
