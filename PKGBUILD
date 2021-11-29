# Maintainer: Jeremy Kescher <jeremy@kescher.at>

# Based on https://aur.archlinux.org/packages/monero-feather-git/

pkgname='monero-feather'
pkgver=1.0.1
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('libzip' 'boost-libs' 'libunwind' 'openssl' 'zeromq' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'libgcrypt'
    'qrencode' 'libsodium' 'expat' 'qt5-base' 'qt5-websockets' 'qt5-svg' 'tor' 'zbar')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://git.featherwallet.org/feather/feather")

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout tags/"$pkgver"
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

