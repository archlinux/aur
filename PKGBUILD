# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.0
pkgrel=3
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v0.2.0.tar.gz "use-system-library.patch")
sha512sums=('f119335e05170c7125d6ecdfdbd9ad30f0bf8fafbd694ecb97e99da25982317dfd0faa9f8b962cda2d2d565a447affefdd8f9198ba85e713fe93f1bd8f90b1ec'
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
