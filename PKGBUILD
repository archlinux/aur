# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.3
pkgrel=5
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

sha256sums=('f7e610024af608d57cc0182a647c4c24a10c47a54960e5f8931d453314f94598'
            '25dc919a47e0e577485e3377c5d3fd7e3fb6064672e9e9f418f783f98fc8aa26'
            'cc7263c2e904a4ac8367ee9dab71662d3e844c626d18571c5098ebc260f183ba')

package() {
	# Install the binary
	install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"
	install -Dm755 "$srcdir/pin-fuzzel" "$pkgdir/usr/bin/pinentry-fuzzel"

	# Install the assets from the source tarball
	install -d "$pkgdir/usr/share/pixmaps"
	cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
		"$pkgdir/usr/share/pixmaps/"
}
