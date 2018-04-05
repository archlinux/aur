# Author: mosra <mosra@centrum.cz>
pkgname=magnum-plugins-git
pkgver=2018.02.r76.g2d3d8d4
pkgrel=1
pkgdesc="Plugins for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="http://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'devil' 'libpng' 'libjpeg' 'freetype2' 'assimp')
makedepends=('cmake' 'git')
provides=('magnum-plugins')
conflicts=('magnum-plugins')
source=("git+git://github.com/mosra/magnum-plugins.git")
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
        -DWITH_ASSIMPIMPORTER=ON \
        -DWITH_DDSIMPORTER=ON \
        -DWITH_DEVILIMAGEIMPORTER=ON \
        -DWITH_DRFLACAUDIOIMPORTER=ON \
        -DWITH_DRWAVAUDIOIMPORTER=ON \
        -DWITH_FREETYPEFONT=ON \
        -DWITH_JPEGIMPORTER=ON \
        -DWITH_MINIEXRIMAGECONVERTER=ON \
        -DWITH_PNGIMAGECONVERTER=ON \
        -DWITH_PNGIMPORTER=ON \
        -DWITH_OPENGEXIMPORTER=ON \
        -DWITH_STANFORDIMPORTER=ON \
        -DWITH_STBIMAGECONVERTER=ON \
        -DWITH_STBIMAGEIMPORTER=ON \
        -DWITH_STBTRUETYPEFONT=ON \
        -DWITH_STBVORBISAUDIOIMPORTER=ON \
        -DWITH_TINYGLTFIMPORTER=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
