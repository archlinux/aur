# Maintainer: Nicole Watterson <poisonimy at protonmail dot com>
pkgname=liboqs-git
pkgver=0.2.0.r74.g795c1b79
pkgrel=1
pkgdesc="C library for quantum-safe cryptography."
arch=('any')
url="https://github.com/open-quantum-safe/liboqs"
license=('MIT')
groups=()
depends=()
makedepends=('cmake' 'gcc' 'ninja' 'openssl' 'python-pytest' 'python-pytest-xdist' 'unzip' 'libxslt' 'doxygen' 'graphviz')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/open-quantum-safe/liboqs.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    echo "$pkgdir"
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -GNinja ..
    ninja
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    ninja install
}
