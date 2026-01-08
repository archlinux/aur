# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.5
pkgrel=9
pkgdesc="A simple Bitwarden RBW frontend for Fuzzel"
arch=('x86_64')
url="https://github.com/lifeashansen/fuzzel-rbw"
license=('MIT')
depends=()
makedepends=()
source=(
	"$url/releases/download/v$pkgver/frbw"
	# use pin-fuzzel as output name since the directory already has a pinentry-fuzzel dir
	"pin-fuzzel::$url/releases/download/v$pkgver/pinentry-fuzzel"
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('3c969e0c0dec7fa143df991555da3536222d78539b37b9b325604d29ec425d1a'
            'f476a73aaffe15b5d61e9180c435f10787ef5a923f69b59ccb8ec3384cd06c1c'
            '51b5fd2b08b61bec0383235e1ae16c4a2d243f510fbbab25c7a757a8a982691c')

package() {
	# Install the binary
	install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"
	install -Dm755 "$srcdir/pin-fuzzel" "$pkgdir/usr/bin/pinentry-fuzzel"

	# Install the assets from the source tarball
	install -d "$pkgdir/usr/share/pixmaps"
	cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
		"$pkgdir/usr/share/pixmaps/"
}
