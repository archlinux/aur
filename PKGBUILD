# Maintainer: let <let@notlet.dev>

pkgname=stormfetch
pkgver=5.1.r1.g153758b
pkgrel=1
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://gitlab.com/CapCreeperGR/stormfetch'
license=('MIT')

makedepends=('go' 'make')
depends=('bash')

source=('git+https://gitlab.com/CapCreeperGR/stormfetch')
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
