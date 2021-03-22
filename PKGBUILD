# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic2013-git
pkgver=r288.c505c71
pkgrel=1
pkgdesc='A full decompilation of Sonic 1 & 2 (2013).'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation'
license=('custom:RSDKv3/4 Decompilation Source Code License v1')
makedepends=('git')
depends=('sdl2' 'libogg' 'libvorbis')
provides=(sonic2013)
source=(
	"git+${url}.git"
	'sonic1-launcher'
	'sonic1.desktop'
	'sonic2-launcher'
	'sonic2.desktop')
sha256sums=(
	'SKIP'
	'ab7f0a5cd733730b1b6935b3c18b4c99a8d005c140c23296f14a135d1cd1b1f7'
	'64f8afbdaa62a63fe9b55c2e0fafd419b80c3201f05e927b1381231ad05853e3'
	'90a8eedbd3ef840185b13be9168f8636bca35ac00c70f3dcf9bb8a5ed4baa15b'
	'a909f52d6b7b4a0d8f0ec11ab5469da3178f494b48865c82f6219e3a97dc666c')
install=sonic2013.install

pkgver() {
	cd "$srcdir/Sonic-1-2-2013-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/Sonic-1-2-2013-Decompilation"
	make ${MAKEFLAGS:--j$(nproc)}
}

package() {
	install -Dm755 sonic1-launcher "$pkgdir/usr/bin/sonic1-launcher"
	install -Dm644 sonic1.desktop "$pkgdir/usr/share/applications/sonic1.desktop"
	install -Dm755 sonic2-launcher "$pkgdir/usr/bin/sonic2-launcher"
	install -Dm644 sonic2.desktop "$pkgdir/usr/share/applications/sonic2.desktop"
	cd "$srcdir/Sonic-1-2-2013-Decompilation/bin"
	install -Dm755 sonic2013 "$pkgdir/usr/bin/sonic2013"
	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
