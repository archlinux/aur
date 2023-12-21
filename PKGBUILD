# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="gossip nostr client built with rust"
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
provides=($pkgname)
conflicts=('gossip' 'gossip-git')
source=(
  "gossip_${pkgver}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v$pkgver/gossip_${pkgver}_amd64.deb"
  "LICENSE::https://github.com/mikedilger/gossip/releases/download/v$pkgver/LICENSE.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=(
  "25b5372911a2f699358eab7d641426e5a75ab31596cf5473a5adecce84ec7ca3"
  "e2860f22b4ae91017e138509f14a0c6c7e63aaae1bda7178b85020301b67cce4"
  "7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b"
)
prepare() {
  ar vx "${srcdir}/gossip_${pkgver}_amd64.deb"
  bsdtar -xvf ${srcdir}/control.tar.xz
  bsdtar -xvf ${srcdir}/data.tar.xz
}

package() {
  install -Dm755 "${srcdir}/usr/bin/gossip" "${pkgdir}/usr/bin/gossip"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/gossip/LICENSE"
  install -Dm644 "${srcdir}/usr/share/applications/gossip.desktop" -t "${pkgdir}/usr/share/applications/gossip.desktop"
  install -Dm644 "${srcdir}/usr/share/doc/gossip/copyright" -t "${pkgdir}/usr/share/doc/gossip/copyright"
  install -Dm644 "${srcdir}/gossip.png" -t "${pkgdir}/usr/share/pixmaps/gossip.png"  
}
