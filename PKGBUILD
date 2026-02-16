# Maintainers: let <let@notlet.dev>, EnumDev <enumdev@enumerated.dev>

pkgname=stormfetch
pkgver=7.4
pkgrel=1
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://github.com/EnumeratedDev/stormfetch'
license=('MIT')

makedepends=('libx11' 'go' 'make')
depends=('sh' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')
backup=(etc/stormfetch/config.yml)
install=stormfetch.install

source=("git+https://github.com/EnumeratedDev/stormfetch.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/stormfetch"
	make PREFIX=/usr SYSCONFDIR=/etc
}

package() {
	cd "$srcdir/stormfetch"
	make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
	make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install-config

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
