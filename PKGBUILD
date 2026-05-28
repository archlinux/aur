# Maintainer: maxischmaxi <max@jeschek.dev>
#
# Stable, versioned package built from a GitHub release tag. pkgver and
# sha256sums are set automatically by the release CI (.github/workflows/
# release.yml) from the pushed tag — the committed placeholders below are only
# for local/manual builds.

pkgname=vibepaper
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland wallpaper daemon that generates and refines wallpapers via OpenAI, Gemini, Stability and other image APIs"
arch=('x86_64')
url="https://github.com/maxischmaxi/vibepaper"
license=('MIT')
depends=('wayland' 'curl' 'cjson')
makedepends=('wayland-protocols' 'pkgconf')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/maxischmaxi/vibepaper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c894f41375d908a91d77cff5c2a45e0e425adf1e8a58fd27302f16d9ce85ca2c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 packaging/vibepaper.service "$pkgdir/usr/lib/systemd/user/vibepaper.service"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
