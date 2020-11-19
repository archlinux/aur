# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.2_eta
pkgrel=1
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=('x86_64' 'i686')
url='http://chan-sccp-b.sourceforge.net'
license=('GPL')
depends=('asterisk' 'zlib')
backup=('etc/asterisk/sccp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chan-sccp/chan-sccp/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('78aa27bbd4dc3fbb647d0c37736eca5434b6cc4cc736897c2577f5883f102836')

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

