# Maintainer: ShortArrow <bamboogeneral@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ShortArrow
_pkgname=runex
_cratename=${_pkgname}
_appname=runex
pkgname=${_cratename}
pkgdesc="Cross-shell abbreviation engine that expands short tokens into full commands"

pkgver=0.1.18
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT' 'Apache-2.0')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'libgcc' 'openssl')

provides=("${_appname}")
conflicts=('runex-bin')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download"
		"LICENSE")
sha256sums=('c88089b8a79e3ba86ad8e2fe66dbb2e978236b36a8930f49d32c1f2776c1b87b'
            '735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
