# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lftp-git
pkgver=4.9.2.r2.g11482e5e
pkgrel=1
pkgdesc="Sophisticated file transfer program"
arch=('i686' 'x86_64')
url="https://lftp.yar.ru/"
license=('GPL3')
depends=('expat' 'gnutls' 'hicolor-icon-theme' 'libidn2' 'readline')
makedepends=('git' 'gperf')
optdepends=('perl' 'sh')
provides=('lftp')
conflicts=('lftp')
backup=('etc/lftp.conf')
source=("git+https://github.com/lavv17/lftp.git")
sha256sums=('SKIP')


pkgver() {
  cd "lftp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lftp"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --disable-static
  make
}

check() {
  cd "lftp"

  make check
}

package() {
  cd "lftp"

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/lib"
}
