# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Cyxuan0311
_pkgname=PNANA
_appname=pnana

pkgname=${_pkgname,,}
pkgver=0.0.5
pkgrel=1
pkgdesc="A modern terminal text editor built with FTXUI, inspired by Nano, Micro, and Sublime Text"

license=('MIT')
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

depends=('glibc' 'gcc-libs' 'ftxui')
makedepends=('gcc' 'cmake' 'go')
provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa2c12922c73c6e1702015a7e6b404678951a9a2d4714c6dbe70df0fb486f484')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	chmod +x "./build.sh"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	./build.sh
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	install -Dm755 "build/${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "build/default_config.json" "${pkgdir}/usr/share/${pkgname}/default_config.json"

	install -Dm644 "QUICKSTART.md" "${pkgdir}/usr/share/doc/${pkgname}/QUICKSTART.md"
	install -Dm644 "README_EN.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
