# Maintainer: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

pkgname=makeself
pkgver=2.2.0
pkgrel=3
pkgdesc="Utility to create self-extracting packages"
arch=('any')
url="http://megastep.org/makeself"
license=('GPL')
depends=('bash')
makedepends=('lynx')
source=("https://github.com/megastep/$pkgname/archive/release-$pkgver.tar.gz")
sha256sums=('9c9d003e097d9c198433a05926e64d9b7cd330c7f10cb4e6048877d0a87de341')

build() {
	cd $srcdir/$pkgname-release-$pkgver
	sed -ie 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' makeself.sh
	./update-readme
}

package() {
	cd $srcdir/$pkgname-release-$pkgver
	install -d $pkgdir/usr/{bin,share/{$pkgname,man/man1}}
	install -m644 makeself.lsm README $pkgdir/usr/share/$pkgname
	install -m644 makeself.1 $pkgdir/usr/share/man/man1/
	install -m755 makeself.sh $pkgdir/usr/bin/makeself
	install -m755 makeself-header.sh $pkgdir/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
