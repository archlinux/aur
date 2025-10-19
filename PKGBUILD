# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=zpotify
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI for Spotify"
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$pkgname"
license=('GPL-3.0')
depends=('libjpeg' 'chafa')
makedepends=('zig')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9ad3f0ac31632a84e3de5a4a8bb73a40883646e0dad98bdbbf7a4d6f5481a83')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	zig build \
		-Dimage-support=true \
		--release=fast \
		-p "$pkgdir/usr"

	mkdir -p "$pkgdir/usr/share/zsh/site-functions"
	$pkgdir/usr/bin/$pkgname completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	chmod 644 "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
