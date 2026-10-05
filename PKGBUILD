# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr
pkgver=0.9.0
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
sha256sums=('7c1efa17725b85ad1b61912b31c400927916a009f58db5d948f6eecf77a5b75d')

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
