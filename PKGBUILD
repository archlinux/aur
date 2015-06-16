# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=rice
pkgver=r20.3c2efcd
pkgrel=4
pkgdesc='A dump of scripts that are used for fun/rice, as seen on TV^H^H the internet.'
arch=('any')
url='https://github.com/janbrennen/rice'
license=('custom:Public Domain')
depends=('lua')
source=('https://github.com/janbrennen/rice/archive/3c2efcd9cc6fb7fcb398f4220d53080b95fb28e2.zip')
sha512sums=('96a8fc9c5ed476db3917bcc1533e456a4afa27185d112f713dfbe2a2cf1a19adc9f13b49f98e31573bc0e906751f35794c7b4095b5ff78e2ddba36bf08bfb345')

build()
{
	cd "$srcdir"/rice-*

	if [ -z "$CC" ]; then
		CC=gcc
	fi
	$CC $CPPFLAGS $CFLAGS -lpthread hack.exe.c -o hack.exe.out
}

package()
{
	cd "$srcdir"/rice-*

	install -Dm755 256color.pl "$pkgdir/usr/bin/256color"

	sed -i '1i#!/usr/bin/lua' 3spooky.lua
	install -Dm755 3spooky.lua "$pkgdir/usr/bin/3spooky"

	install -Dm755 hackertyper.sh "$pkgdir/usr/bin/hackertyper"

	install -Dm755 hack.exe.out "$pkgdir/usr/bin/hack.exe"

	install -Dm755 pipes.sh "$pkgdir/usr/bin/pipes"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	echo 'This script is currently in the Public Domain.' > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
