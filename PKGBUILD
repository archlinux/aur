# Author: mosra <mosra@centrum.cz>
pkgname=magnum-integration-git
pkgver=snapshot.2015.05.r250.g96fa27a
pkgrel=1
pkgdesc="Integration libraries for Magnum OpenGL graphics engine (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/magnum.php"
license=('MIT')
depends=('magnum-git' 'bullet')
makedepends=('cmake' 'git')
provides=('magnum-integration')
conflicts=('magnum-integration')
source=("git+git://github.com/mosra/magnum-integration.git")
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
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_BULLET=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
