# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.11
_pkgpatch=0
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
  "gossip_${pkgver}.${_pkgpatch}-${pkgrel}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v$pkgver/gossip_${pkgver}.${_pkgpatch}-${pkgrel}_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/README.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('06cbe484d71a43095a419893275f60dff0bed52d3f6d37a0231484b1a721d018'
            '8a8543ebe0203fa8597bfcf70e7841f6fb66367358ff6180be692d4d724def70'
            '916e2b47e5a3877629f95c989126e2af17c0d88f95786be30520640359934104'
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
