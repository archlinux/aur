# Maintainer: servitkar <servitkar at gmail dot com>
pkgname=kodi-addon-pvr-sledovanitv-cz-git
pkgver=1.9.0.Leia.r0.g5390c53
pkgrel=1
pkgdesc="sledovanitv.cz/sk PVR client addon for Kodi from palinek's sources"
arch=('any')
url="https://github.com/palinek/pvr.sledovanitv.cz"
license=('GPL')
depends=('jsoncpp' 'kodi')
makedepends=('cmake' 'git' 'kodi-dev' 'kodi-platform')
conflicts=('kodi-addon-pvr-sledovanitv')
source=("$pkgname::git+https://github.com/palinek/pvr.sledovanitv.cz.git#branch=Leia")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
