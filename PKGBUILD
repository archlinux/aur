# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv-light
pkgver=0.9.1
pkgrel=1
pkgdesc='Qt5 image viewer (without any optional features)'
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://github.com/easymodo/qimgv
license=(GPL3)
depends=(qt5-base qt5-imageformats qt5-svg)
makedepends=(cmake qt5-tools git)
provides=("${pkgname%-light}")
conflicts=("${pkgname%-light}")
optdepends=('kimageformats: support for more image formats'
            'qt5-apng-plugin: animated png support'
            'qtraw: raw images support')
source=(git+"${url}".git#tag=v"${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -B build -S "${pkgname%-light}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DEXIV2=OFF \
        -DVIDEO_SUPPORT=OFF \
        -DOPENCV_SUPPORT=OFF
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
