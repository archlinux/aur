# Contributor: strata <strata@dropswitch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgbase=lrexlib
pkgname=(
	lrexlib-gnu
	lrexlib-oniguruma
	lrexlib-pcre
	lrexlib-posix
	lrexlib-tre
)
pkgver=2.9.0
pkgrel=1
pkgdesc="Regular expression libraries for Lua"
arch=('i686' 'x86_64')
url="http://rrthomas.github.com/lrexlib/"
license=('custom')
makedepends=('luarocks' 'oniguruma' 'pcre' 'tre')
provides=('lrexlib')
source=(
	"https://luarocks.org/lrexlib-gnu-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-oniguruma-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-pcre-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-posix-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-tre-$pkgver-$pkgrel.src.rock"
)
sha512sums=('9204bdd61b8e7c9e151dc9acd58f0229b65ff7bcbcf16257a7dcb42473f7c55e1076e663e8b90194421955ab865d901543380049ec3a1bcae3cc502a888a8216'
            '8f8b9dc51e39ddc8a7e0b470dc22700efbb83caf061f73f2b5693db6388dad877604b759e38f429dc2c794b66aa349c440f50d1c3dad9bff8a894be58930d065'
            '221684896293c247357fd20dc377f4ddab564aebab3b37aa4a67b1ad0ba49ae11a02579236c9733d19716b8a5e23ec2a1c986001188a87c431a7476a6482ae31'
            'b8a683aa059cf4476a71eb8b13be3299c23cd5e9f2a571ebe83cba03d3037a7b8bf990918ad25cf9543b7f742c21753eab12f953fb34b23bab193474b1d3b132'
            '1b0b4a9270f26714f4569adbb4d181e3845f69b06406299adc21a4bae2eada23b84c1bb6bca82365e7eba09e54f7212bba165ad20b67f9367d2ea62749a9ac0c')
noextract=(
	"lrexlib-gnu-$pkgver-$pkgrel.src.rock"
	"lrexlib-oniguruma-$pkgver-$pkgrel.src.rock"
	"lrexlib-pcre-$pkgver-$pkgrel.src.rock"
	"lrexlib-posix-$pkgver-$pkgrel.src.rock"
	"lrexlib-tre-$pkgver-$pkgrel.src.rock"
)

_do_package() {
	luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$pkgrel.src.rock"

	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgname/$pkgver-$pkgrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	rm -f "$pkgdir/usr/share/doc/$pkgname/.gitignore"
	ln -s "../../doc/$pkgname/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

package_lrexlib-gnu() {
	pkgdesc="Regular expression library for Lua - GNU version"

	_do_package
}

package_lrexlib-oniguruma() {
	pkgdesc="Regular expression library for Lua - Oniguruma version"
	depends+=('oniguruma')

	_do_package
}

package_lrexlib-pcre() {
	pkgdesc="Regular expression library for Lua - PCRE version"
	depends+=('pcre')

	_do_package
}

package_lrexlib-posix() {
	pkgdesc="Regular expression library for Lua - POSIX version"

	_do_package
}

package_lrexlib-tre() {
	pkgdesc="Regular expression library for Lua - TRE version"
	depends+=('tre')

	_do_package
}
