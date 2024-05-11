# Maintainer: let <let@notlet.dev>

pkgname=stormfetch
pkgver=1.1.r0.g2b33b64
pkgrel=3
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://gitlab.com/CapCreeperGR/stormfetch'
license=('MIT')

makedepends=('go')
depends=('bash')
optdepends=(
	'xorg-xhost: display DE/WM and monitor information'
	'xorg-xdpyinfo: display screen resolution'
	'lshw: display GPU information'
)

source=('git+https://gitlab.com/CapCreeperGR/stormfetch')
sha256sums=('SKIP')

build() {
	cd "$srcdir/stormfetch"
	go build -o out stormfetch
}

package() {
	install -Dm755 "$srcdir/stormfetch/out" "$pkgdir/usr/bin/stormfetch"
	install -Dm644 "$srcdir/stormfetch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/etc"
	cp -r "$srcdir/stormfetch/config" "$pkgdir/etc/stormfetch"
}

pkgver() {
	cd "$srcdir/stormfetch"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
