# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=conkeror-git
pkgver=1.0.4.r13.g5e5736d
pkgrel=1
pkgdesc='A keyboard-oriented, highly-customizable, highly-extensible web browser based on Mozilla XULRunner.'
arch=('i686' 'x86_64')
url='http://conkeror.mozdev.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('palemoon')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/aplaice/conkeror")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's:-\(.*\)-:.r\1.:;s!debian/!!g;s!.-\(.\)!\1!'
}

build() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	sed -i 's/firefox/palemoon/g' $pkgdir/usr/bin/conkeror
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-*}"
	mv "$pkgdir/usr/share/doc/conkeror/COPYING" \
	   "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"
}
