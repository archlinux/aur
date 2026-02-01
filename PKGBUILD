# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_cratesio_package='preset'

pkgname="${_cratesio_package}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Save and run command presets"

license=('MIT')
arch=('any')

_url_cratesio='https://crates.io/crates/preset'
_url_github='https://github.com/VG-dev1/preset'
url="${_url_github}"

provides=("${pkgname}")

depends=('glibc' 'gcc-libs')
makedepends=('rust')

# source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratesio_package}/${pkgver}/download")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc368a3c491c382d68b7b3d2d0946f0c6b703fdbdcedaae22e7959e30f113ff2')

build() {
	cd ${srcdir}/${_cratesio_package}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratesio_package}-${pkgver} || exit 1

	install -Dm755 "target/release/${_cratesio_package}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
