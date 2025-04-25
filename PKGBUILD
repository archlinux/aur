# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>

# Based on https://aur.archlinux.org/packages/monero-feather-git/

pkgname='feather-wallet'
pkgver=2.8.1
_pkgname=feather-${pkgver}
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD-3-Clause')
arch=('x86_64')
url="https://featherwallet.org"
depends=('boost-libs' 'expat' 'hidapi' 'libgcrypt' 'libsodium' 'libunwind' 'libusb' 'libzip'
         'openssl' 'protobuf' 'qrencode' 'qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-websockets' 'unbound' 'zbar'
				 'rapidjson' 'zxing-cpp')
makedepends=('git' 'cmake' 'boost')
optdepends=('tor: To use .onion Monero nodes')
provides=('feather-wallet')
conflicts=('monero-feather' 'monero-feather-git' 'featherwallet-bin' 'featherwallet-appimage')

source=(https://featherwallet.org/files/releases/source/feather-${pkgver}.tar.gz)

sha256sums=('1db8cbc5123abc8de63c96e6aedc08a8cda669b032b75c18f955e71ce8c4291e')

prepare() {
	cd ${_pkgname}
  rm -rf build/*
  mkdir -p build
  cd build
  cmake .. -DMANUAL_SUBMODULES=1
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  cmake --build .
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/build/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${_pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/src/assets/images/appicons/256x256.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}
