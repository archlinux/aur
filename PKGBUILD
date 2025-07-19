# Maintainer: Wade Duvall <wsduvall@proton.me>
# Contributor: Daniel <dgcbueu@gmail.com>

pkgname=netdiscover
pkgver=0.20
pkgrel=0
pkgdesc="A network address discovering tool"
arch=('i686' 'x86_64')
url="https://github.com/netdiscover-scanner/netdiscover/"
license=('GPL-3.0-only')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make' 'wget' 'dos2unix')
provides=('netdiscover')
source=("https://github.com/netdiscover-scanner/netdiscover/releases/download/${pkgver}/netdiscover-${pkgver}.tar.gz")
sha256sums=('d7c40559487905059c99f1b2ae7b1a148c9f7cd45f58ac5d834faa35d9bf5f6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./update-oui-database.sh
  ./autogen.sh
  ./configure --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
}
