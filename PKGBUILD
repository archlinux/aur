# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv-light
pkgver=1.0.1
pkgrel=1
pkgdesc='Qt6 image viewer (without any optional features)'
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://github.com/easymodo/qimgv
license=(GPL3)
depends=(qt6-base qt6-imageformats qt6-svg qt6-5compat)
makedepends=(cmake qt6-tools)
provides=("${pkgname%-light}")
conflicts=("${pkgname%-light}")
optdepends=('kimageformats: support for more image formats'
            'qtraw: raw images support')
source=("${pkgname%-light}"-"${pkgver}".tar.gz::"${url}"/archive/refs/tags/v"${pkgver}".tar.gz)
sha256sums=('6d794a11f7e2f8ca0453c6e778a214005e81b69cef50a0198e9eaf949eda4f06')

build() {
    cmake -B build -S "${pkgname%-light}"-"${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DEXIV2=OFF \
        -DVIDEO_SUPPORT=OFF \
        -DOPENCV_SUPPORT=OFF \
        -Wno-dev
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
