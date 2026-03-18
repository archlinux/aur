# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neur0map
_pkgname=manx-cli
_cratename=${_pkgname}
_appname=manx
pkgname=${_cratename}
pkgdesc="Blazing-fast CLI tool for developers to find documentation, code snippets, and answers instantly, online or offline with or without LLM and RAG integration"

pkgver=0.5.7
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('GPL-3.0')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')

provides=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('2fe47cb8cdc65ffe6d4034ecb6d3adcc749425a6ab82650bc6efbfe6807357d4')


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
