# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://git.reekynet.com/ReekyMarko/lqsd"
license=('Apache')
depends=('light')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/ReekyMarko/${pkgname}/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0e20a2814af13b1db4b3f2cf5a45105c1400e8da56495609803a95ccb5b01d4f')

prepare() {
	mv $srcdir/*/ $srcdir/$pkgname-$pkgver
}

build(){
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check(){
	cd "$pkgname-$pkgver"
	cargo test --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
