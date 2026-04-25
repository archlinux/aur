# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Cyxuan0311
_pkgname=PNANA
_appname=pnana

pkgname=${_pkgname,,}
pkgver=0.0.6
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
sha256sums=('e5b1dddaa65e3948c548bccdd1308cf72d8d5d94f420c721dd2100f0ffd2506a')

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
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "RELEASE.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
