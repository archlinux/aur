# Maintainer: Rustam Aliyev <ru5j4r0@google.com>
pkgname=pyflow
pkgver=0.2.4
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("https://github.com/ru5j4r0/aur/raw/master/pyflow/$pkgname-$pkgver.tar.zst")
b2sums=(f627b528be505ff999385a50f840baae7fc1a1e88c29d20b11e548c9eaa6fc15cf115e678f4eed7cbda0153c46d54769b835ffc86d13401a0a43cdaaaa5e59fb)
validpgpkeys=(B3D4420410BC16F84C358DF6AF36488D565A347A)

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" target/release/pyflow
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
