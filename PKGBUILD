# Maintainers: let <let@notlet.dev>, EnumDev <enumdev@enumerated.dev>

pkgname=stormfetch
pkgver=5.4.r0.g76974ee
pkgrel=1
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://gitlab.com/EnumDev/stormfetch'
license=('MIT')

makedepends=('libx11' 'go' 'make')
depends=('bash' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')

source=('git+https://gitlab.com/EnumDev/stormfetch')
sha256sums=('SKIP')

build() {
	cd "$srcdir/stormfetch"
	make SYSCONFDIR=/etc
}

package() {
	cd "$srcdir/stormfetch"
	make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
	install -Dm644 "$srcdir/stormfetch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$srcdir/stormfetch"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
