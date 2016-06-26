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
pkgver=2.8.0
pkgrel=1
pkgdesc="Regular expression libraries for Lua"
arch=('i686' 'x86_64')
url="http://rrthomas.github.com/lrexlib/"
license=('custom')
makedepends=('luarocks')
provides=('lrexlib')
source=(
	"https://luarocks.org/lrexlib-gnu-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-oniguruma-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-pcre-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-posix-$pkgver-$pkgrel.src.rock"
	"https://luarocks.org/lrexlib-tre-$pkgver-$pkgrel.src.rock"
)
noextract=(
	"lrexlib-gnu-$pkgver-$pkgrel.src.rock"
	"lrexlib-oniguruma-$pkgver-$pkgrel.src.rock"
	"lrexlib-pcre-$pkgver-$pkgrel.src.rock"
	"lrexlib-posix-$pkgver-$pkgrel.src.rock"
	"lrexlib-tre-$pkgver-$pkgrel.src.rock"
)
sha512sums=(
	'094004723cc6a300377b33b4c9a91d41625b06b622655b4d66f7d7e389ad5729ca07f7343acd8d72f8cc2eacaabae3b0b96572c75a25f0098822994a6965e6f4'
	'22214e274fcda24f1744444a5461a01481536ed14aab1df91371eae845a5cbbca6ca7df07b3b9859448af354494c9603c659567a90af847c9f986eec1924c90f'
	'a75837ab50748963b993b623ad648f6f147496767975a59165f72f02fa1edf1f396c37477d84cfd39b622cfe808248b139070fe310a26ca69de04a95c02b22c7'
	'7cf92da4d12fb6f2a808ce6120eabf8147e35aa2d9df58c6c164478f5d5be70241eb01e95d95cd16e01a1b380c9be62d8d07e0946906cbf2f0e7bb463985fa3c'
	'798ea42aa4974a30db889addb788f22e058594a10c506aa6371715a97ca85972a9bfedf4026a355c1ae0ff74d650b41847402eb04b82cdc7dda15e770006d01b'
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
	conflicts=('lrexlib-pcre5.1')

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
