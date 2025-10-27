# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.4
pkgrel=6
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

sha256sums=('84d9e42a2bda339908eec9358d86246ab3c2fe0f224c869a3016fe15c5a4c707'
	'8bfa5fddab3bc27faa0f5145dd84992adb8223b99cb593fd8773edf368fed6f0'
	'2f9285d1b26bb1fda3fb5f710b0a68356b0969cdd5c2de2eb0236fd0193ab0fa')

package() {
	# Install the binary
	install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"
	install -Dm755 "$srcdir/pin-fuzzel" "$pkgdir/usr/bin/pinentry-fuzzel"

	# Install the assets from the source tarball
	install -d "$pkgdir/usr/share/pixmaps"
	cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
		"$pkgdir/usr/share/pixmaps/"
}
