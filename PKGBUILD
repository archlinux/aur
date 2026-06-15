# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
pkgname=gerbv-git
_pkgname=gerbv
pkgver=2.13.0.r83.g9c90d82
pkgrel=1
epoch=3
pkgdesc="An open source Gerber file (RS-274X only) viewer"
url="https://github.com/gerbv/gerbv"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
depends=('gtk2')
provides=('gerbv')
conflicts=('gerbv')
optdepends=('cairo: for better graphics')
makedepends=('cmake' 'git' 'gettext' 'ninja')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build () {
  cd $_pkgname
  rm -rf build
  cmake -DVERSION="2.10.0" -DCMAKE_INSTALL_PREFIX="/usr" --preset linux-gnu-gcc
  cmake --build build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" cmake --install build
}
