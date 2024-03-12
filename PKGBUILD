# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.8.19
pkgrel=2

pkgdesc="A full-featured download manager (binary version)"
arch=('x86_64')
url="https://github.com/agalwood/Motrix"
license=('MIT')

conflicts=('motrix' 'motrix-git')
depends=('gtk3' 'libxcb' 'nss')
changelog="changelog.md"

source=("https://github.com/agalwood/Motrix/releases/download/v${pkgver}/Motrix_${pkgver}_amd64.deb")
sha512sums=('8a3dab9c731268c2291f286d8efa7815046bbe00046deb938db061863d3ad3e14ddcb50ba4a7e44ada2c11d196d660bb6a762af4e6e589ddb38692266010e61a')

package() {
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

	# Link to the binary
	mkdir -p "$pkgdir/usr/bin"
	ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

	# SUID chrome-sandbox for electron 5+ as indicated here: https://github.com/electron/electron/issues/17972#issuecomment-487369441
	chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
