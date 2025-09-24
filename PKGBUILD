# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.2
pkgrel=4
pkgdesc="A simple Bitwarden RBW frontend for Fuzzel"
arch=('x86_64')
url="https://github.com/sammhansen/fuzzel-rbw"
license=('MIT')
depends=()
makedepends=()
source=(
	"$url/releases/download/v$pkgver/frbw"
	# use pin-fuzzel as output name since the directory already has a pinentry-fuzzel dir
	"pin-fuzzel::$url/releases/download/v$pkgver/pinentry-fuzzel"
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('6c49f0bc765269b616e4a2f0d10fa4349acbf1d8ea62fa0c8241ee530aaaeaf6'
	'25dc919a47e0e577485e3377c5d3fd7e3fb6064672e9e9f418f783f98fc8aa26'
	'4d183685b496d7e413e73ba507d4e8ea9a1fc4b8d981e007c5264162da419c4a')

package() {
	# Install the binary
	install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"
	install -Dm755 "$srcdir/pin-fuzzel" "$pkgdir/usr/bin/pinentry-fuzzel"

	# Install the assets from the source tarball
	install -d "$pkgdir/usr/share/pixmaps"
	cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
		"$pkgdir/usr/share/pixmaps/"
}
