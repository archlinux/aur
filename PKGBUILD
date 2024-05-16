# Maintainer: let <let@notlet.dev>

pkgname=stormfetch
pkgver=3.0.r0.g2af3ab1
pkgrel=1
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://gitlab.com/CapCreeperGR/stormfetch'
license=('MIT')

makedepends=('go')
depends=('bash')

# no longer needed
# optdepends=(
# 	'xorg-xhost: display DE/WM and monitor information'
# 	'xorg-xdpyinfo: display screen resolution'
# 	'lshw: display GPU information'
# ) 

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
