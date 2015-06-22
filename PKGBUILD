# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=dtv-scan-tables-git
pkgver=r1183.f2053b3
pkgrel=3
pkgdesc="Digital TV scan tables"
arch=('any')
url="http://linuxtv.org/"
license=('GPL2' 'LGPL2')
makedepends=('git' 'v4l-utils')
conflicts=('dtv-scan-tables')
provides=('dtv-scan-tables')
source=('git://linuxtv.org/dtv-scan-tables.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dtv-scan-tables"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dtv-scan-tables"
  make dvbv3
}

package() {
  cd "$srcdir/dtv-scan-tables"
  make PREFIX="$pkgdir/usr" DVBV5DIR=dvb install
  make PREFIX="$pkgdir/usr" install_v3
}
