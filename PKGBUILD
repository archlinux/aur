# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_cratesio_package='flux-cli'

pkgname="${_cratesio_package%%-cli}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Search, monitor, and nuke processes with ease, with system resource tracking"

license=('MIT')
arch=('any')

_url_cratesio='https://crates.io/crates/flux-cli'
_url_github='https://github.com/VG-dev1/flux'
url="${_url_github}"

provides=("${pkgname}")

depends=('glibc' 'gcc-libs')
makedepends=('rust')

# source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratesio_package}/${pkgver}/download")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca01a86c8f0563320162343686f90a8283e284924fbb5ca35fd56188b9a80e0e')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
