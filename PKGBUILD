# Maintainer: Justin Woodring <jwoodrg@gmail.com>
pkgname=aespresso
pkgver=0.2.1
pkgrel=1
pkgdesc="A GTK4 frontend for archlinux's archlinux-java script"
arch=('x86_64')
url="https://github.com/JustinWoodring/aespresso"
license=('BSD-2-Clause')
depends=('gtk4' 'java-runtime-common' 'polkit')
optdepends=('lxqt-sudo: alternative privilege escalation helper')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abc435aac0d6e10ecd59f522047a0c65ee068f259b14a5a2cb07a6a702ea5634')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/aespresso -t "$pkgdir/usr/bin/"
	install -Dm644 aespresso.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 aespresso.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/aespresso.png"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
