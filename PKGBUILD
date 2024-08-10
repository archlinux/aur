# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.11
pkgrel=3
pkgdesc="gossip nostr client built with rust"
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
provides=('gossip=${pkgver}.${pkgrel}')
conflicts=('gossip' 'gossip-git')
depends=(
  'glibc'
  'gcc-libs'
)
source=(
  "gossip_${pkgver}.${pkgrel}-1_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/gossip_${pkgver}.${pkgrel}-1_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/README.txt"
  "changelog.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/changelog-${pkgver}.${pkgrel}.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('cfabc8788aca8e4ac07d4cf6da605de8729cbbac0e356563b12c796be680ed1a'
            '8a8543ebe0203fa8597bfcf70e7841f6fb66367358ff6180be692d4d724def70'
            '2314c3d6c044e57531fea4e6fc67686e0794d9ac83f6d3bfa9b07e095ba6c54d'
            '660df6dacde13c3c9ebc10a57e81c87d467278e3baa16be29e856987601209f9'
            '7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b')

prepare() {
  ar vx "${srcdir}/gossip_${pkgver}.${pkgrel}-1_amd64.deb"
  bsdtar -xvf ${srcdir}/control.tar.xz
  bsdtar -xvf ${srcdir}/data.tar.xz
}

package() {
  install -Dm755 "${srcdir}/usr/bin/gossip" "${pkgdir}/usr/bin/gossip"
  install -Dm644 "${srcdir}/LICENSE.txt" -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/usr/share/applications/gossip.desktop" -T "${pkgdir}/usr/share/applications/gossip.desktop"
  install -Dm644 "${srcdir}/changelog.txt" -T "${pkgdir}/usr/share/doc/gossip/changelog.txt"
  install -Dm644 "${srcdir}/README.txt" -T "${pkgdir}/usr/share/doc/gossip/README.txt"
  install -Dm644 "${srcdir}/gossip.png" -T "${pkgdir}/usr/share/pixmaps/gossip.png"  
}
