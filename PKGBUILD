# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.11
_pkgpatch=1
pkgrel=1
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
  "gossip_${pkgver}.${_pkgpatch}-${pkgrel}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgpatch}/gossip_${pkgver}.${_pkgpatch}-${pkgrel}_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgpatch}/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${_pkgpatch}/README.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('e3651847f96a3a5cb89509b18d3fc57f9cea14a0f670b6defb6e76cc15a502c0'
            '8a8543ebe0203fa8597bfcf70e7841f6fb66367358ff6180be692d4d724def70'
            '7acd0473c04ca9df5a1ac5556fd9ec89bdf4ce19c740b1c550a23fa03bc8f8ac'
            '7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b')

prepare() {
  ar vx "${srcdir}/gossip_${pkgver}.${_pkgpatch}-${pkgrel}_amd64.deb"
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
