# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=libtgbot-cpp
pkgver=1.2.1
pkgrel=1
pkgdesc="C++ library for Telegram bot API."
arch=('x86_64')
url="https://github.com/reo7sp/tgbot-cpp"
license=('MIT')
depends=('openssl' 'boost-libs' 'curl')
makedepends=('boost' 'cmake' 'git')
replaces=('libtgbot-cpp-git')
source=("git+https://github.com/reo7sp/tgbot-cpp#tag=v${pkgver}"
	'TGBOTConfig.cmake')
sha256sums=('SKIP'
            'fea742c2fbecc92141ed22404862f81247b3b52d3ed4ecea0903d4dc27e3b521')

build() {
  cd "${srcdir}/tgbot-cpp"
  mkdir -p build

  cmake -B build \
	-DBUILD_SHARED_LIBS=ON \
	-DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "${srcdir}/tgbot-cpp"
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 "${srcdir}/TGBOTConfig.cmake" \
	-t "${pkgdir}"/usr/lib/cmake/TGBOT
}
