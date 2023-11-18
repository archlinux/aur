# Maintainer: Ryan Paroz <ryan@paroz.io>
pkgname=git-ps-rs
pkgver=6.9.0
pkgrel=1
pkgdesc="A patch-stack oriented Git wrapper"
arch=('x86_64')
url="https://git-ps.sh"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git' 'gpgme' 'libgpg-error' 'openssl' 'zlib')
makedepends=('rust')
source=("https://github.com/uptech/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('e59e985465f5cc65a300fe2e5008b333')
sha256sums=('d2a0eb50e74529f9c125cb7d7a0f5e8c01b4debb1a0814702f7a9f28bbe524c5')

build() {
	cd "$pkgname-$pkgver"
    cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo check --release
    ls target/release/gps
}

package() {
	cd "$pkgname-$pkgver"
    install -D -m 644 LICENSE $pkgdir/usr/share/licenses/git-ps-rs/LICENSE
    install -D -m 755 target/release/gps $pkgdir/usr/bin/gps
}
