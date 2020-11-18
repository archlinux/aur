# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libprelude
pkgver=5.2.0
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
source=("https://www.prelude-siem.org/pkg/src/5.2.0/$pkgname-$pkgver.tar.gz"
        "libprelude-5.1.0-fix_gtkdoc_1.32.patch"
        "libprelude-5.2.0-fix_ruby27.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

prepare () {
  patch -p0 <libprelude-5.1.0-fix_gtkdoc_1.32.patch
  patch -p0 <libprelude-5.2.0-fix_ruby27.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('4db429af160450dc37c7ade001abf8c4'
         '005972ce0674e45ad048c547d37f9f37'
         'd72321076622b5e3129c6cd52ed86b28')
