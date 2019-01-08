# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.1
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz "use-system-library.patch")
sha512sums=('379c6382f2e8d786231d6e558c6f63053fae465315378559d56f77818b4abf04c6aab9b78a802c2c4c5eca035f76f8e9766d7f093973f2b607e266139af221b5'
            'd53050632a6f68705d344469a040579e5ea23db6ce7e1e36ae2f7a206a543cbea409ad3f025495a9f12c46a4c488ffbfab3cc781cbed058f88a3c23f8d2667cf')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/use-system-library.patch"
}

build() {
	cd "$pkgname-$pkgver/nitrocli"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver/nitrocli"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
