# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=maki-cli
pkgname=${_pkgname}
pkgdesc="A cross-platform fuzzy Makefile task finder"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('rust')
depends=('glibc' 'gcc-libs')

provides=("${_pkgname%%-cli}")

source=("${_pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_pkgname}/${pkgver}/download")
sha256sums=('2fdcd16b69b2999379ca7b1c7337cec31adbbe8fd10deae8364c7fc91502c1d2')


build() {
	cd ${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname%%-cli}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

