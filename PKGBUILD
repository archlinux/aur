# Maintainer: Helso Tainer <helsotainer@gmail.com>
pkgname=pavuk
pkgver=0.9.35
pkgrel=1
pkgdesc="UNIX program used to mirror the contents of WWW documents or files."
url="http://www.pavuk.org/"
arch=('x86_64')
license=('GPLv2')
depends=('glibc')
optdepends=('gtk2: for X windows support'
	'zlib: for online decoding of encoded documents'
	'openssl: for SSL support')
source=("https://netix.dl.sourceforge.net/project/pavuk/pavuk/0.9.35/pavuk-0.9.35.tar.bz2"
        "pavuk.desktop")
md5sums=('6204c7a1339433ab32456ccd62126ea9'
		'SKIP')
options=('!buildflags' '!makeflags')
build() {
 	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-utf-8  --with-x
	make "LDFLAGS=-lX11" all
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make VERBOSE=1 DESTDIR="${pkgdir}" prefix="$pkgdir/usr"  install
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  cd "${srcdir}/"
  install -Dm644 pavuk.desktop "$pkgdir/usr/share/applications/pavuk.desktop"
}

# vim:set ts=2 sw=2 et: