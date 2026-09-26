# Maintainer: CosmicHeron <dev cosmicheron com>

_bin='ziso'
pkgname="${_bin}_compressor_rust"
pkgdesc='A rust written ziso compressor with multipple threads support'
url='https://github.com/Danixu/ziso_compressor_rust'
license=('Apache-2.0')
pkgver='1.0.1'
pkgrel='1'
arch=('x86_64' 'aarch64')
provides=("$_bin")
depends=('glibc' 'libgcc')
makedepends=('cargo')
_src="${pkgname}-${pkgver}"
source=("${_src}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5d98bad48b2d3c7f8b727bcb04370174ca14b4e3b911ed5240c1a85d8f8ff1db490a09d25e2b666f8a6ce5ca27fc8f17ec17b72102a40a38c195bc056a3c62d8')
options=('!lto')

prepare() {
	cd "$_src" || exit
	cargo fetch --locked
}

build() {
	cd "$_src" || exit
	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${_src}" || exit
	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_bin}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
