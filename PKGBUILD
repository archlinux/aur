# Maintainer: Booglejr <rooty (a+) kwtechllc (dot) com>
pkgname=aespresso
pkgver=0.1.2
pkgrel=1
epoch=0
pkgdesc="A Gtk3 frontend for archlinux's archlinux-java script."
arch=('x86_64')
url="https://github.com/Booglejr/$pkgname/releases"
license=('custom:BSD')
depends=('gtk3' 'lxqt-sudo' 'java-runtime-common')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Booglejr/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('c8267f1ae4ea11173ba3710a655744bb')


build() {
	cd "$pkgname-$pkgver"
	cargo build --release --bin ${pkgname} --target-dir .
}

package() {
	cd "$pkgname-$pkgver"
	cd release
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	cd ..
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
