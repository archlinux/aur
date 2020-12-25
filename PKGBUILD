# Maintainer: Sosthène Guédon <sosthene+aur@guedon.gdn>
pkgname=superflu-riteurnz
pkgver=1.0.0
__pkgver=1.0.0-xmas2020demo
pkgrel=1
pkgdesc="Artisanal point and click game"
arch=('any')
url="https://ptilouk.net/superflu-riteurnz/index.html"
license=('GPL3')
depends=('libyaml' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme')
makedepends=(
    'cmake'
)

source=(
    "https://framagit.org/Gee/sosage/-/archive/v$pkgver/sosage-v$pkgver.tar.gz"
    "https://dl.bintray.com/ptilouk/superflu-riteurnz/zip/superflu-riteurnz-v1.0.0-xmas2020demo-data.zip"
)

md5sums=('35c37491cd9979ff87221ac4d471b388'
         'b8c2f5db362be3300df588e114d5a98a')

build() {
    ls
    rm "sosage-v$pkgver/$pkgname-v$__pkgver-data" -rf
    mv "$pkgname-v$__pkgver-data" "sosage-v$pkgver/$pkgname-v$__pkgver-data"
    cd "sosage-v$pkgver"
    mkdir -p build #-p to not fail if directory is already present
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DSOSAGE_DATA_FOLDER="../$pkgname-v$__pkgver-data" \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "sosage-v$pkgver/build"
    make install DESTDIR="$pkgdir"
}

