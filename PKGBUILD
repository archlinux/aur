# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sysid
_pkgname=rs-env
_appname=${_pkgname//-/}
pkgname=${_appname}
pkgdesc="Hierarchical environment management with secure vault storage"

pkgver=2.0.0_rc
pkgrel=3
_appvername=v${pkgver//_/-}.${pkgrel}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('BSD-3-Clause')

makedepends=('rust')
depends=('glibc' 'gcc-libs' 'direnv' 'sops')

provides=("${_appname}")

source=("${_appname}-${_appvername}.tgz::${url}/archive/${_appvername}.tar.gz")
sha256sums=('3c51861389e8717d653ed78850424a80c1081a14983278a1f8b878b41a426613')


build() {
	cd ${srcdir}/${_pkgname}-${pkgver//_/-}.${pkgrel}/${_appname}/ || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver//_/-}.${pkgrel} || exit 1

	install -Dm755 "${_appname}/target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
