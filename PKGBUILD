# Maintainer: Chase Geigle <sky.strife@gmail.com>

pkgname=obs-v4l2sink
pkgver=0.1.0
obsver=22.0.2
pkgrel=1
epoch=
pkgdesc="v4l2 output for obs-studio"
arch=(x86_64)
url="https://github.com/CatxFish/obs-v4l2sink"
license=('GPL')
groups=()
depends=('obs-studio')
makedepends=('obs-studio' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver.tar.gz"
        "https://github.com/obsproject/obs-studio/archive/$obsver.tar.gz")
noextract=()
md5sums=('94632ee7e73e512dcc9877f5cc87c8ea'
         '8c63cdc08a4510f288d174c65b252544')
validpgpkeys=()

prepare() {
    rm -rf build
    mkdir build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
      -DCMAKE_BUILD_TYPE=Release \
      -DLIBOBS_INCLUDE_DIR=../obs-studio-$obsver/libobs \
      -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" make install
}
