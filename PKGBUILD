# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr
pkgver=0.8.0
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whattui terminal frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('glibc' 'libjpeg-turbo')
optdepends=('ffmpeg: video posters and voice note waveforms')
makedepends=('go' 'gcc' 'just' 'python')
provides=('whatevrd' 'whattui')
conflicts=('whatevr-git' 'whatevr-bin')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('86f44fb0a98de4412a88915a89270d3c969ccc5dc5fd5f87e445ae2e18f34fbf')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	just build-release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	just install /usr "$pkgdir"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
