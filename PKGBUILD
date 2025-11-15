# Maintainer: Blueze <lukmanaffandi900@gmail.com>
pkgname=zencore-rs
_name=zencore-rs
_binname=zencore
pkgver=1.3
pkgrel=1
pkgdesc="A minimalist backup solution built with Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/Blues24/Zencore-rs"
license=("GPL-3.0-or-later")
depends=('base-devel' 'openssl' 'pkgconf')
makedepends=('git' 'rust' 'cargo')
provides=('zencore')
conflicts=('zencore')
options=(!emptydirs)
source=('git+https://github.com/Blues24/Zencore-rs#branch=main')
sha256sums=('SKIP')

build(){
	cd "$srcdir/$_name" || exit 1
	
	export ZSTD_SYS_USE_PKG_CONFIG=0

	# build a release profile
	cargo build -j 4 --release
}

package(){
	cd "$srcdir/$_name" || exit 1

	# Install binary
	install -D -o root -g root -m 755 target/release/zencore "$pkgdir/usr/bin/${_binname}"
	
	# Install license
	install -Dm 644 "${srcdir}/Zencore-rs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}

