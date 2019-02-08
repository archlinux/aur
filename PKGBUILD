pkgname=libtgbot-cpp
pkgver=1.1
pkgrel=1
pkgdesc="C++ library for Telegram bot API."
arch=('x86_64')
url="https://github.com/reo7sp/tgbot-cpp"
license=('MIT')
depends=('openssl' 'boost-libs')
makedepends=('boost' 'cmake')
replaces=('libtgbot-cpp-git')
source=(
	'https://github.com/reo7sp/tgbot-cpp/archive/v1.1.tar.gz'
	'TGBOTConfig.cmake'
)
sha256sums=('0f3bd884f11f5a229f1bd49d55754670e07e6e31798fb162a0b1c8f74e633180'
            'fea742c2fbecc92141ed22404862f81247b3b52d3ed4ecea0903d4dc27e3b521')

build() {
	cd "${srcdir}/tgbot-cpp-${pkgver}"
	mkdir -p build
	cd build
	cmake \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
}

package() {
	cd "${srcdir}/tgbot-cpp-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/tgbot-cpp-${pkgver}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 "${srcdir}/TGBOTConfig.cmake" "${pkgdir}"/usr/lib/cmake/TGBOT/TGBOTConfig.cmake
}
