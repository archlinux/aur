# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libprelude
pkgver=4.1.0
pkgrel=1
pkgdesc="Provides the framework for using the Prelude system"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'lua' 'ruby')
backup=('etc/prelude/default/client.conf'
        'etc/prelude/default/global.conf'
        'etc/prelude/default/idmef-client.conf'
	'etc/prelude/default/tls.conf')
source=("https://www.prelude-siem.org/pkg/src/4.1.0/$pkgname-$pkgver.tar.gz"
	"libprelude-4.1.0-fix_compatibility_gnutls_3_6.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

prepare() {
  patch -p0 <libprelude-4.1.0-fix_compatibility_gnutls_3_6.patch
}

md5sums=('d75977db58de9ba4cf9c4d00a0e25cb9' '5237abe04d26bc071b1018d456550259')
