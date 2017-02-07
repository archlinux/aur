# Author: mosra <mosra@centrum.cz>
pkgname=corrade-git
pkgver=snapshot.2015.05.r574.g462b6184
pkgrel=1
pkgdesc="C++11/C++14 multiplatform utility library (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/corrade.php"
license=('MIT')
makedepends=('cmake' 'git')
provides=('corrade')
conflicts=('corrade')
source=("git+git://github.com/mosra/corrade.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
