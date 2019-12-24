# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv
pkgver=0.8.8
pkgrel=1
pkgdesc="Qt5 image viewer with experimental webm playback"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://github.com/easymodo/qimgv"
license=(GPL3)
depends=(qt5-base qt5-imageformats qt5-svg mpv exiv2)
makedepends=(cmake qt5-tools)
optdepednds=('qt5-apng-plugin: animated png support'
             'qtraw: raw images support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/easymodo/qimgv/archive/v${pkgver}.tar.gz")
sha256sums=('2be509d55f052d602e9e2a1cc1e537049e4bff552d864cf4aeb281a397b94496')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}
