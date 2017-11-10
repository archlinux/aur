#Maintainer: Mariszo <mariszo@itfinger.com>
#Contributor: Mariszo <mariszo@itfinger.com>

pkgname=railcar-git
pkgver=1.0.4.47.bedd974597
pkgrel=1
pkgdesc="Rust implementation of the Open Containers Initiative oci-runtime"
url="https://github.com/oracle/railcar"
depends=('gcc-libs' 'libseccomp')
makedepends=('git' 'rustup')
conflicts=('railcar')
arch=('x86_64')
provides=('railcar')
license=("APACHE")
source=('git+https://github.com/oracle/railcar.git')
sha512sums=('SKIP')
 
prepare() {
	rustup toolchain install stable-$CARCH-unknown-linux-gnu
	rustup default stable-$CARCH-unknown-linux-gnu
	rustup target install $CARCH-unknown-linux-musl

	cargo install cargo-when --force
}

build() {
	cd railcar
	./build.sh
}

package() {
	 install -D -m 0755 railcar/railcar "$pkgdir/usr/bin/railcar"
}

