# Contributor: Chris Allison <chris.allison@hotmail.com>
pkgname=dvbstreamer
pkgver=2.1.0
pkgrel=4
pkgdesc="console based application to stream DVB/ATSC service(s) over UDP or to a file."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dvbstreamer/"
license=('GPL')
depends=('sqlite3' 'readline' 'libltdl' 'libyaml' 'libev')
source=(http://downloads.sourceforge.net/dvbstreamer/$pkgname-$pkgver.tar.bz2
       https://raw.githubusercontent.com/ccdale/dvbstreamer-patches/master/dvbstreamer-2.1.0-libev4.patch
       https://raw.githubusercontent.com/ccdale/dvbstreamer-patches/master/dvbstreamer-2.1.0-daemon_pidfile.patch)

md5sums=('593859be04aa121cfd1c0b714ea034cc'
         '81d505daa77aa1896254f7fca3cca471'
         '636a901ede93a12abd1caf471d4f1b9f')

build() {
  export CFLAGS="$CFLAGS"

  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ../../$pkgname-$pkgver-libev4.patch
  patch -Np1 -i ../../$pkgname-$pkgver-daemon_pidfile.patch

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
