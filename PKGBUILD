# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=ness-stretch-git
pkgver=r178.e64eb33
pkgrel=1
pkgdesc="Implements a phase randomized Real FFT time stretch algorithm, the NessStretch, which splits the original sound file into 9 discrete frequency bands, and uses a decreasing frame size to correspond to increasing frequency."
arch=('x86_64')
url="https://github.com/spluta/TimeStretch"
license=('GPL')
groups=('pro-audio')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$pkgname/rust"
	cargo test --locked
}

build() {
	cd "$pkgname/rust"
	cargo build --release 
}

package() {
	cd "$pkgname/rust"
	install -Dm755 "target/release/ness_stretch" "$pkgdir/usr/bin/ness_stretch"
}
