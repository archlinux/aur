# Maintainer: TPHRyan <ryan.paroz@gmail.com>
pkgname=git-ps-rs
pkgver=7.0.0
pkgrel=1
pkgdesc="A patch stack oriented Git wrapper"
arch=('x86_64')
url="https://git-ps.sh"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git' 'gpgme' 'libgpg-error' 'openssl' 'zlib')
makedepends=('rust')
source=("https://github.com/uptech/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('ef8555860cefc1b76efe3cc8e3f304a5')
sha256sums=('13577cd919acefcd39c3ff9416545d3bfb7be6d8dbc8e50b7c50df37c5fb99e8')

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
