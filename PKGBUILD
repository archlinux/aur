# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>

pkgname='wownero-feather-git'
pkgver=0.3.0.3a23db1479
pkgrel=1
pkgdesc='a free Wownero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'pcsclite' 'hidapi' 'protobuf' 'miniupnpc' 'libgcrypt' 'qrencode' 'libsodium' 'libpgm' 'expat' 'qt5-base' 'qt5-websockets' 'tor')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://git.wownero.com/feather/feather-wow")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake ..
  make
}

package_wownero-feather-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/bin/feather-wow" "${pkgdir}/usr/bin/feather-wow"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather-wow.desktop" "${pkgdir}/usr/share/applications/feather-wow.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/256x256.png" "${pkgdir}/usr/share/pixmaps/feather-wow.png"
}
