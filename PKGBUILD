# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv-light
_pkgver=1.0.3-alpha
pkgver=${_pkgver/-}
pkgrel=1
pkgdesc='Qt6 image viewer (without any optional features)'
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://github.com/easymodo/qimgv
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-imageformats qt6-svg)
makedepends=(cmake qt6-tools)
provides=("${pkgname%-light}")
conflicts=("${pkgname%-light}")
optdepends=('kimageformats: support for more image formats')
source=("${pkgname%-light}"-"${pkgver}".tar.gz::"${url}"/archive/refs/tags/v"${_pkgver}".tar.gz)
sha256sums=('94c03ee3d79db1891d0b6e5cdb084bcee71e14dd36c11831d15a42b18c1399c9')

build() {
    cmake -B build -S "${pkgname%-light}"-"${_pkgver}" \
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
