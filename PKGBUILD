# Author: mosra <mosra@centrum.cz>
pkgname=corrade-git
pkgver=2019.10.r267.g282b432a
pkgrel=1
pkgdesc="C++11/C++14 multiplatform utility library (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics/corrade/"
license=('MIT')
makedepends=('cmake' 'git' 'ninja')
provides=('corrade')
conflicts=('corrade')
source=("git+git://github.com/mosra/corrade.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
