# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libprelude
pkgver=5.1.1
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
source=("https://www.prelude-siem.org/pkg/src/5.1.0/$pkgname-$pkgver.tar.gz"
	"libprelude-5.1.0-fix_awk_error.patch"
	"libprelude-5.1.0-fix_gtkdoc_1.32.patch"
	"libprelude-5.1.0-fix_py38.patch"
	)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

prepare() {
  patch -p0 <libprelude-5.1.0-fix_awk_error.patch
  patch -p0 <libprelude-5.1.0-fix_gtkdoc_1.32.patch
  patch -p0 <libprelude-5.1.0-fix_py38.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('9302c68e1c84a847f77574ab048177e6' '6e68405705b75b0ce25b8165db8c4e2e' '25529ffd018e827c07d5dc2b4a5d44ae' 'b63554f1057f054a96d470d70056c668')
