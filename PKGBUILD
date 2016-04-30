# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libprelude
pkgver=3.0.0
pkgrel=1
pkgdesc="Provides the framework for using the Prelude system"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'lua' 'ruby')
backup=('etc/prelude/default/client.conf'
        'etc/prelude/default/global.conf'
        'etc/prelude/default/idmef-client.conf'
        'etc/prelude/default/tls.conf')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz"
        "ruby.patch" "ruby_swig.patch" "python_swig.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

prepare() {
  patch -p0 <ruby.patch
  patch -p0 <python_swig.patch
  patch -p0 <ruby_swig.patch
}

md5sums=('c93f5735c3dd162835b5597542f05282' '76a67088c8fc3b09cf47faa4b5d82d6b' '5c6260da1c4de6c7779e0f572994df51' '7a841d6ec5b2657a2a8d991a00f17a05')
