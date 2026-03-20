# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_cratesio_package='weathery'

pkgname="${_cratesio_package}"
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal weather app with animated cityscapes"

license=('GPL-3.0')
arch=('any')

_url_cratesio='https://crates.io/crates/weathery'
_url_github='https://github.com/VG-dev1/weathery'
url="${_url_github}"

provides=("${pkgname}")

depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('rust')

# source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratesio_package}/${pkgver}/download")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7634b8291f6f24d50dffbc8c434aa15566c6f6a12f36394d8cf77be3d9926d10')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
