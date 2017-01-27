# Maintainer: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname=makeself
pkgver=2.3.0
pkgrel=2
pkgdesc="Utility to create self-extracting packages"
arch=('any')
url="http://megastep.org/makeself"
license=('GPL')
depends=('bash')
source=("https://github.com/megastep/$pkgname/archive/release-$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname-release-$pkgver
	sed -ie 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' makeself.sh
}

package() {
	cd $srcdir/$pkgname-release-$pkgver
	install -d $pkgdir/usr/{bin,share/{$pkgname,man/man1}}
	install -m644 makeself.lsm README.md $pkgdir/usr/share/$pkgname
	install -m644 makeself.1 $pkgdir/usr/share/man/man1/
	install -m755 makeself.sh $pkgdir/usr/bin/makeself
	install -m755 makeself-header.sh $pkgdir/usr/share/$pkgname
}

sha256sums=('e89ceeabc28246e62887177942adc9c466c9eab04809a2854eb42c6ce66630fa')
