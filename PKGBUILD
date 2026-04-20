# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgname=ocx
pkgver=2.0.7
pkgrel=1
pkgdesc="OpenCode extension manager with portable, isolated profiles. Your setup, anywhere."
arch=(any)
url="https://github.com/kdcokenny/ocx"
license=(MIT)
depends=(bun)
makedepends=(git)
source=("git+$url#tag=v$pkgver")
sha256sums=('e63b7ca60e69962eb348282a5e28519ea4ab712e5edd56e2ea7ab3a340008158')

prepare() {
	cd $pkgname
	bun install --frozen-lockfile
}

build() {
	cd $pkgname/packages/cli
	bun run build
}

check() {
	cd $pkgname
	bun run check
	bun run test
}

package() {
	cd $pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	cd packages/cli
	install -Dm755 dist/index.js "$pkgdir/usr/bin/ocx"
}
