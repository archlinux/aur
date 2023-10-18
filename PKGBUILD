# Maintainer: a821
# Contributor: Ben Booth <benwbooth@gmail.com>

pkgname=bamtools-git
pkgver=2.5.2.r4.g2bd8699
pkgrel=1
pkgdesc="C++ API & command-line toolkit for working with BAM data"
arch=('x86_64')
url="https://github.com/pezmaster31/bamtools"
license=('MIT')
depends=('gcc-libs' 'jsoncpp' 'zlib')
makedepends=('cmake' 'git')
provides=('bamtools')
conflicts=('bamtools')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    git -C bamtools describe --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cmake -B build -S bamtools \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    cmake --build build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 bamtools/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
} 

# vim: set ts=4 sw=4 et:
