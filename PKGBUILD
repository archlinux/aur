# Author: mosra <mosra@centrum.cz>
pkgname=magnum-examples-git
pkgver=snapshot.2015.05.r64.gc7ff155
pkgrel=1
pkgdesc="Examples for Magnum OpenGL graphics engine (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/magnum.php"
license=('MIT')
depends=('magnum-git' 'magnum-plugins-git' 'magnum-integration-git' 'bullet' 'openal')
makedepends=('cmake' 'git')
provides=('magnum-examples')
conflicts=('magnum-examples')
source=("git+git://github.com/mosra/magnum-examples.git")
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
        -DWITH_AUDIO=ON \
        -DWITH_BULLET=ON \
        -DWITH_CUBEMAP=ON \
        -DWITH_MOTIONBLUR=ON \
        -DWITH_PRIMITIVES=ON \
        -DWITH_PICKING=ON \
        -DWITH_TEXT=ON \
        -DWITH_TEXTUREDTRIANGLE=ON \
        -DWITH_TRIANGLE=ON \
        -DWITH_VIEWER=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
