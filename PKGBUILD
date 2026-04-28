# Maintainer: E.A.Davison <eadavison at protonmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: C. Dominik Bódi <dominikdotbodiatgmxdotde>
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-qt6
pkgver=3.18
pkgrel=1
pkgdesc="Open source downloader for GOG.com games, with QT6 enabled for solving reCAPTCHA"
url="https://sites.google.com/site/gogdownloader/"
arch=(x86_64 i686 pentium4)
license=(WTFPL)
depends=(boost-libs jsoncpp tinyxml2 rhash tidy qt6-webengine)
makedepends=(help2man cmake boost)
provides=(lgogdownloader)
conflicts=(lgogdownloader)
source=("https://github.com/Sude-/lgogdownloader/releases/download/v${pkgver}/lgogdownloader-${pkgver}.tar.gz")
sha256sums=('1974f09cb0e0cdfed536937335488548addd92e5c654f4229ac22594a22f8ae0')

prepare() {
  cd "${srcdir}/lgogdownloader-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/lgogdownloader-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT_GUI=ON

  make
}

package() {
  cd "${srcdir}/lgogdownloader-${pkgver}/build"
  make DESTDIR=$pkgdir install
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
