# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=d99kris
_pkgname=idntag
pkgname=${_pkgname}
pkgver=2.00
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Automatically identify, tag and rename audio files"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'ncurses' 'taglib' 'curl')
makedepends=('cmake' 'pkg-config' 'nlohmann-json' 'chromaprint' 'help2man')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fe03f18373c00cd6099c68a578062f167115bbbe4cbd726e0509cec76fe8e361')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	mkdir -p build && cd build

	cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr/" .. && make -s
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build

	make install
}
