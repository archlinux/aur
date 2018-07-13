# Maintainer: Ben Oliver <ben@bfoliver.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
pkgname=slrn
pkgver=1.0.3
pkgrel=4
pkgdesc="An open source text-based news client"
arch=('x86_64')
url="http://www.slrn.org/"
license=('GPL')
depends=('openssl' 'slang')
makedepends=('uudeview')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman')
source=("https://jedsoft.org/releases/slrn/slrn-${pkgver}a.tar.bz2")
sha256sums=('3ba8a4d549201640f2b82d53fb1bec1250f908052a7983f0061c983c634c2dac')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
	--enable-setgid-code \
	--with-slrnpull --with-ssl --with-uu \
	--with-uulib=/usr/lib/uudeview \
	--with-uuinc=/usr/include/uudeview \
	--enable-spoilers
  make UUDEVIEW_LIB="/usr/lib/uudeview/*.o"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}
