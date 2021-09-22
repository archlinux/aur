# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv-light
pkgver=1.0.0
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
source=("${pkgname%-light}"-"${pkgver}".tar.gz::"${url}"/archive/refs/tags/v1.0.0.tar.gz)
sha256sums=('82888f744435e7e944558d26b0b4ac053cf5f2e581e2497cbb6ce3d65cf47fea')

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
