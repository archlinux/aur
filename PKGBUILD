#Maintainer: Mariszo <mariszo@itfinger.com>
#Contributor: Mariszo <mariszo@itfinger.com>

pkgname=railcar
pkgver=1.0.4
pkgrel=1
pkgdesc="Rust implementation of the Open Containers Initiative oci-runtime"
url="https://github.com/oracle/railcar"
depends=('gcc-libs' 'libseccomp')
makedepends=('rustup')
arch=('x86_64')
source=("$pkgver.tar.gz::https://github.com/oracle/railcar/archive/v$pkgver.tar.gz")
provides=('railcar')
license=("APACHE")
sha512sums=('83cb2309bd333e98c9c6a7768df6fb389b0e4d6c07821db494ccf3882938334f4ab5221d5a695df8e4871619d14eeb2e52d7d21af83f86b389e33e428f1d6c3d')
 
prepare() {
	rustup toolchain install stable-$CARCH-unknown-linux-gnu
	rustup default stable-$CARCH-unknown-linux-gnu
	rustup target install $CARCH-unknown-linux-musl

	cargo install cargo-when --force
}

build() {
	cd $pkgname-$pkgver
	./build.sh
}

package() {
 install -D -m 0755 $pkgname-$pkgver/railcar "$pkgdir/usr/bin/railcar"
}

