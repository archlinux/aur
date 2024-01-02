# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="gossip nostr client built with rust"
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
provides=($pkgname)
conflicts=('gossip' 'gossip-git')
depends=(
  'glibc'
  'gcc-libs'
)
source=(
  "gossip_${pkgver}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v$pkgver/gossip_${pkgver}_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/README.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=(
  "83760acc0ad65f0bea06bdce73a158041b2816a3924d98ab4693bdc7cd9fd22c"  
  "e2860f22b4ae91017e138509f14a0c6c7e63aaae1bda7178b85020301b67cce4"
  "65a1e61fc5374f7c391f230856809c8b37c8527c25a7a0d9113ce46d8920a8ef"
  "7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b"
)
prepare() {
  ar vx "${srcdir}/gossip_${pkgver}_amd64.deb"
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
