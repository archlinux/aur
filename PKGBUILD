# Maintainer: Bogdan Danylchenko <exp.wez@gmail.com>
pkgname=hexa-git
pkgver=232
pkgrel=1
pkgdesc="Hexa is a programming language in an early stage of development"
arch=('x86_64')
url="https://github.com/hexalang/hexa"
license=('MIT')
makedepends=('git' 'nodejs')
depends=('nodejs')
provides=('hexa')
source=("hexa::git+https://github.com/hexalang/hexa" "hexa.sh")
md5sums=('SKIP' '8e53c16d280ac91c0544d1770a7f04a7')

pkgver() {
	cd "$SRCDEST"/hexa
	git rev-list HEAD --count
}

build() {
	cd $srcdir/hexa
	node bootstrap.js hexa.json
	node hexa-node.js hexa.json
}

package() {
	# cd $srcdir/hexa
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/hexa-git
	mkdir -p $pkgdir/usr/share/hexa
	mkdir -p $pkgdir/usr/share/hexa/library

	cp $srcdir/hexa/hexa-node.js $pkgdir/usr/share/hexa/hexa-node.js
	cp $srcdir/hexa/repl.json $pkgdir/usr/share/hexa/repl.json
	cp $srcdir/hexa/repl.hexa $pkgdir/usr/share/hexa/repl.hexa
	cp -a $srcdir/hexa/library $pkgdir/usr/share/hexa
	cp $srcdir/hexa/LICENSE $pkgdir/usr/share/licenses/hexa-git/LICENSE

	
	mkdir -p $srcdir/hexabin
	cp $srcdir/hexa.sh $srcdir/hexabin/hexa

    install --mode=755 "$srcdir/hexabin/hexa" "$pkgdir"/usr/bin/
}
