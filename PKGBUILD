# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: robertfoster

pkgauthor=keshavbhatt
pkgname=whatsie
pkgver=6.2.0
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"

arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

makedepends=('git' 'cmake')
depends=('qt6-base' 'qt6-declarative' 'qt6-location' 'qt6-svg' 'qt6-webchannel' 'qt6-webengine')

provides=("${pkgname}")

source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('da5dac640a6d2c4368fb48bde15679d7e8d9950e32bccbe001d40160efbe4bc2')


prepare() {
	cd "${pkgname}"

	git submodule update --init --recursive
}

build() {
	cmake -S "${pkgname}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DWHATSIE_BUILD_TESTS=OFF \
		-Bbuild

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
