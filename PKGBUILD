# Maintainer: Bogdan Danylchenko <exp.wez@gmail.com>
pkgname=hexa-git
pkgver=277
pkgrel=1
pkgdesc="Hexa is a programming language in an early stage of development"
arch=('x86_64')
url="https://github.com/hexalang/hexa"
license=('MIT')
makedepends=('git' 'nodejs')
depends=('nodejs')
provides=('hexa')
source=("hexa::git+https://github.com/hexalang/hexa" "hexa.sh")
md5sums=('SKIP' 'ba6c114926428fc72cfa569490f547b0')

pkgver() {
	cd "$SRCDEST"/hexa
	git rev-list HEAD --count
}

build() {
	cd $srcdir/hexa
    node bootstrap.js hexa.json
}

package() {
	# cd $srcdir/hexa
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/hexa-git
	mkdir -p $pkgdir/usr/share/hexa
	mkdir -p $pkgdir/usr/share/hexa/library

	cp $srcdir/hexa/hexa.js $pkgdir/usr/share/hexa/hexa.js
	cp -a $srcdir/hexa/library $pkgdir/usr/share/hexa
	cp $srcdir/hexa/LICENSE $pkgdir/usr/share/licenses/hexa-git/LICENSE

	mkdir -p $srcdir/hexabin
	cp $srcdir/hexa.sh $srcdir/hexabin/hexa
    install --mode=755 "$srcdir/hexabin/hexa" "$pkgdir"/usr/bin/
}
