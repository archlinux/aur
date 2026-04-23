# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=byedroid
_cratename=${_pkgname}
_appname=bd
pkgname=${_cratename}
pkgdesc="Terminal UI for Android development"

pkgver=0.6.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf' 'openssl' 'libgit2')
depends=('glibc' 'gcc-libs' 'libgit2')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('1815716fda4aa15fe91b2014cb582ef9f2c349e2489c9ad44e23a3975fcf472a')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
