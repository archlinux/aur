# Maintainer: RAMA <143774106+Nomadcxx@users.noreply.github.com>
pkgname=sysclet-git
pkgver=r6.gc8d8fb9
pkgrel=1
pkgdesc="Generate ANSI text headers from TheDraw TDF fonts"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysclet"
license=('GPL-3.0-only')
makedepends=('git' 'go')
provides=('sysclet')
conflicts=('sysclet')
options=('!debug')
source=('sysclet::git+https://github.com/Nomadcxx/sysclet.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/sysclet"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/sysclet"
	export CGO_ENABLED=0
	go build -mod=readonly -trimpath -ldflags='-s -w' -o sysclet .
}

package() {
	cd "$srcdir/sysclet"
	install -Dm755 sysclet "$pkgdir/usr/bin/sysclet"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
