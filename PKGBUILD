# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=simu
_cratename=${_pkgname}
_appname=simu
pkgname=${_cratename}
pkgdesc="A CLI tool for managing iOS simulators"

pkgver=0.1.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust')
depends=('glibc' 'gcc-libs')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('1e484d43c742daf0586dcf1cc72da750e5cd19526a26a35e8a52cafa835e83ba')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
