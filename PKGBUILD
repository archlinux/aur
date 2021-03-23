# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>

pkgname='wowlet-git'
pkgver=0.1.0.0.732f34b595
pkgrel=1
pkgdesc='a free Wownero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://git.wownero.com/wowlet/wowlet"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'pcsclite' 'hidapi' 'protobuf' 'miniupnpc' 'libgcrypt' 'qrencode' 'libsodium' 'libpgm' 'expat' 'qt5-base' 'qt5-websockets' 'tor')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://git.wownero.com/wowlet/wowlet")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake ..
  make
}

package_wowlet-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/bin/wowlet" "${pkgdir}/usr/bin/wowlet"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/wowlet.desktop" "${pkgdir}/usr/share/applications/wowlet.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/wowlet.png" "${pkgdir}/usr/share/pixmaps/wowlet.png"
}

