# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=2.4.1
pkgrel=1

pkgdesc="A full-featured download manager (binary version)"
arch=('x86_64')
url="https://github.com/agalwood/Motrix"
license=('MIT')

conflicts=('motrix' 'motrix-git')
depends=('gtk3' 'libxcb' 'nss')
changelog="changelog.md"

source=("https://github.com/agalwood/Motrix/releases/download/v${pkgver}/Motrix_${pkgver}_amd64.deb")
sha512sums=('16d3527e3a132250b25b057c513d56958b50edbb633be9b798b3fa674f08b42c93639bbbe1437321ec4e9ba53e23fc49812235feeb95a711a832c280c7113d5f')

package() {
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

	# Link to the binary
	mkdir -p "$pkgdir/usr/bin"
	ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

	# SUID chrome-sandbox for electron 5+ as indicated here: https://github.com/electron/electron/issues/17972#issuecomment-487369441
	chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
