# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Cyxuan0311
_pkgname=FTB
_appname=ftb

pkgname=${_pkgname,,}
pkgver=2.1.1
pkgrel=1
pkgdesc="A file browser built with FTXUI"

license=('MIT')
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

depends=('glibc' 'gcc-libs' 'ftxui' 'mysql' 'libssh2' 'yaml-cpp' 'tbb' 'ffmpeg' 'libx11')
makedepends=('gcc' 'cmake')
provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('212d56fa48b1c4992161cf61ef54708819e713290396e1308a021b789f400d42')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	mkdir -p build && cd build || exit 1

	cmake .. &&	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
