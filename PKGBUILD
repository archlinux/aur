# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>

pkgname='monero-feather-git'
pkgver=0.3.0.2b6145ea4f
pkgrel=1
pkgdesc='a free Monero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'pcsclite' 'hidapi' 'protobuf' 'miniupnpc' 'libgcrypt' 'qrencode' 'libsodium' 'libpgm' 'expat' 'qt5-base' 'qt5-websockets' 'tor')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://git.wownero.com/feather/feather")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake ..
  make
}

package_monero-feather-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}

post_install () {
  echo ""
  echo ""
  echo "============================================"
  echo " START TOR SERVICE BEFORE RUNNING FEATHER"
  echo "============================================"
  echo ""
  echo "Start Tor service with:"
  echo ""
  echo "sudo systemctl start tor.service"
  echo ""
  echo "Check Tor status with:"
  echo ""
  echo "systemctl status tor.service"
  echo ""
  echo "Stop Tor service with:"
  echo ""
  echo "sudo systemctl stop tor.service"
  echo ""
  echo ""
}
