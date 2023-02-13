# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>
# Contributor: tobtoht <dev[at]featherwallet[dot]org>

pkgname='monero-feather-git'
pkgver=2.4.0.d566c7a
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('libzip' 'boost-libs' 'libunwind' 'openssl' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'libgcrypt'
         'qrencode' 'libsodium' 'expat' 'qt6-base' 'qt6-websockets' 'qt6-svg' 'tor' 'zbar' 'unbound' 'qt6-multimedia')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://github.com/feather-wallet/feather")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir build
  cd build
  cmake ..
  cmake --build . -j$(nproc)
}

package_monero-feather-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}
