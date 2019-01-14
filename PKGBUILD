# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.2
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz "use-system-library.patch")
sha512sums=('3304591001675e3fff3bdf43fb464739308e498e66362b49704c29a8b71104176c6c2401b75a78e951f32007464f13174a9736c7fb90bc89108c38b2f7afcb24'
            'c4fb3e9db2c599bce900047289a1a9791263d334440af72ed79ba14d3356bfcea9a1356b97bc124fd278735f31d70489625ee06bd77f3700b115505ae5f505f8')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/use-system-library.patch"
}

build() {
	cd "$pkgname-$pkgver/nitrocli"
	cargo build --release --frozen
}

package() {
	cd "$pkgname-$pkgver/nitrocli"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
