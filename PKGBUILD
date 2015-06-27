# Author: mosra <mosra@centrum.cz>
pkgname=magnum-plugins-git
pkgver=snapshot.2015.05.r22.g8b68e4b
pkgrel=1
pkgdesc="Plugins for Magnum graphics engine (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/magnum.php"
license=('MIT')
depends=('magnum-git' 'libpng' 'libjpeg' 'freetype2')
makedepends=('cmake' 'git')
provides=('magnum-plugins')
conflicts=('magnum-plugins')
source=("git+git://github.com/mosra/magnum-plugins.git")
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
        -DWITH_ANYIMAGEIMPORTER=ON \
        -DWITH_ANYSCENEIMPORTER=ON \
        -DWITH_FREETYPEFONT=ON \
        -DWITH_JPEGIMPORTER=ON \
        -DWITH_PNGIMPORTER=ON \
        -DWITH_OPENGEXIMPORTER=ON \
        -DWITH_STANFORDIMPORTER=ON \
        -DWITH_STBIMAGEIMPORTER=ON \
        -DWITH_STBPNGIMAGECONVERTER=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
