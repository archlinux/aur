# Maintainer: Jeremy Kescher <jeremy@kescher.at>

# Based on https://aur.archlinux.org/packages/monero-feather-git/

pkgname='monero-feather'
pkgver=2.0.0
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('libzip' 'boost-libs' 'libunwind' 'openssl' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'libgcrypt'
         'qrencode' 'libsodium' 'expat' 'qt6-base' 'qt6-websockets' 'qt6-svg' 'tor' 'zbar' 'unbound')
makedepends=('git' 'cmake' 'boost')
provides=('monero-feather')
conflicts=('monero-feather' 'monero-feather-git')

source=("${pkgname}"::"git+https://github.com/feather-wallet/feather.git#tag=${pkgver}")

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  make release
}

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/release/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}

