# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sysid
_pkgname=rs-env
_appname=${_pkgname//-/}
pkgname=${_appname}
pkgdesc="Hierarchical environment management with secure vault storage"

pkgver=3.1.0
pkgrel=1
_appvername=v${pkgver//_/-}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('BSD-3-Clause')

makedepends=('rust')
depends=('glibc' 'gcc-libs' 'direnv' 'sops')

provides=("${_appname}")

source=("${_appname}-${_appvername}.tgz::${url}/archive/${_appvername}.tar.gz")
sha256sums=('f9c9924c9201958f631ff1b9603086689f78acad00321972c640d642db61e534')


build() {
	cd ${srcdir}/${_pkgname}-${pkgver//_/-}/${_appname}/ || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver//_/-}/ || exit 1

	install -Dm755 "${_appname}/target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
