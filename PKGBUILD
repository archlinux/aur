# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.4
pkgrel=1
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=('x86_64' 'i686')
url='http://chan-sccp-b.sourceforge.net'
license=('GPL')
depends=('asterisk' 'zlib')
backup=('etc/asterisk/sccp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chan-sccp/chan-sccp/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('29b808e2329da46eba2a163615202d9fa89c4b6db00ec3b9589ec12ab76e7882')

build() {
  local asterisk_version=$(asterisk -V | sed -e 's/.* \([0-9]\+\.[0-9]\+\).*/\1/')
  cd "$pkgname-${pkgver/_/-}"
  ./configure --prefix=/usr --with-asterisk-version=$asterisk_version
  make
}

package(){
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install
}

