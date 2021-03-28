# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=kwprocessor

pkgver=1.00
pkgrel=1

pkgdesc='Advanced keyboard-walk generator with configureable basechars, keymap and routes'
arch=('i686' 'x86_64')
url="https://hashcat.net/wiki/doku.php?id=$pkgname"
license=('MIT')

depends=('glibc')

source=("$pkgname-$pkgver.tgz::https://github.com/hashcat/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b6565d6cb131f75acd0732973a4e0702ff6abeb233e19894314408e3261b62e')


build() {
	cd "$pkgname-$pkgver"
	gcc -march=znver2 -pipe -fno-plt -fdiagnostics-color=always -time -O2 -W -Wall -std=c99 \
		-o "$pkgname" src/kwp.c
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname"    -t"$pkgdir/usr/bin/"
	ln      -s     "$pkgname"      "$pkgdir/usr/bin/kwp"
	sed 's|doc/\(img/.*\.png\)|\1|' README.md | install \
			-Dm644 /dev/stdin      "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 basechars/*   -t"$pkgdir/usr/share/$pkgname/basechars/"
	install -Dm644 keymaps/*     -t"$pkgdir/usr/share/$pkgname/keymaps/"
	install -Dm644 routes/*      -t"$pkgdir/usr/share/$pkgname/routes/"
	install -Dm644 doc/img/*     -t"$pkgdir/usr/share/doc/$pkgname/img/"
	install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
