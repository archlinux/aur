# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.11
pkgrel=2
_pkgrel=2
_pkgpatch=1
_rel=2
pkgdesc="gossip nostr client built with rust"
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
provides=('gossip=${pkgver}')
conflicts=('gossip' 'gossip-git')
depends=(
  'glibc'
  'gcc-libs'
)
source=(
  "gossip_${pkgver}.${_pkgrel}-${_pkgpatch}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgrel}/gossip_${pkgver}.${_pkgrel}-${_pkgpatch}_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgrel}/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgrel}/README.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('9a90af8069c609ee6f8949ed9eb95b2f7b190cdcfc47c0a1b3e47a1d8b86a995'
            '8a8543ebe0203fa8597bfcf70e7841f6fb66367358ff6180be692d4d724def70'
            '37e31f5ba5afbfedacad2e5a044736ac5a4ab64fec6948f2ed1f3d0202fe7c6b'
            '7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b')

prepare() {
  ar vx "${srcdir}/gossip_${pkgver}.${_pkgrel}-${_pkgpatch}_amd64.deb"
  bsdtar -xvf ${srcdir}/control.tar.xz
  bsdtar -xvf ${srcdir}/data.tar.xz
}

package() {
  install -Dm755 "${srcdir}/usr/bin/gossip" "${pkgdir}/usr/bin/gossip"
  install -Dm644 "${srcdir}/LICENSE.txt" -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/usr/share/applications/gossip.desktop" -T "${pkgdir}/usr/share/applications/gossip.desktop"
  install -Dm644 "${srcdir}/usr/share/doc/gossip/copyright" -T "${pkgdir}/usr/share/doc/gossip/copyright"
  install -Dm644 "${srcdir}/README.txt" -T "${pkgdir}/usr/share/doc/gossip/README.txt"
  install -Dm644 "${srcdir}/gossip.png" -T "${pkgdir}/usr/share/pixmaps/gossip.png"  
}
