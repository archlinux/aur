# Maintainer: Lukas1818 aur at lukas1818 dot de
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: C. Dominik Bódi <dominikdotbodiatgmxdotde>
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-headless
pkgver=3.7
pkgrel=1
pkgdesc="Open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(x86_64 i686 pentium4)
license=('custom:WTFPL')
conflicts=('lgogdownloader' 'lgogdownloader-git' 'lgogdownloader-headless-git')
provides=("lgogdownloader=$pkgver")
depends=(boost-libs jsoncpp tinyxml2 rhash htmlcxx curl)
makedepends=(help2man cmake boost)
source=("http://sites.google.com/site/gogdownloader/${pkgname%-headless}-${pkgver}.tar.gz")
sha256sums=('984859eb2e0802cfe6fe76b1fe4b90e7354e95d52c001b6b434e0a9f5ed23bf0')

prepare() {
  cd "${srcdir}/${pkgname%-headless}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname%-headless}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "${srcdir}/${pkgname%-headless}-${pkgver}/build"
  make DESTDIR=$pkgdir install
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
