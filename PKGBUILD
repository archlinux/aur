# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.10.1
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
  "gossip_${pkgver}_amd64.deb::https://github.com/mikedilger/gossip/releases/download/v$pkgver/gossip_${pkgver}-${pkgrel}_amd64.deb"
  "LICENSE.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/LICENSE.txt"
  "README.txt::https://github.com/mikedilger/gossip/releases/download/v$pkgver/README.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('6da1572905f6958aa406abbb9f0f471b6bb211017578b003bc60563fda9b2c3b'
            'e2860f22b4ae91017e138509f14a0c6c7e63aaae1bda7178b85020301b67cce4'
            'f571ac9d80a185f2b7e981bda48673f04ee4622c34fe5e3a175f5962aff6cf96'
            '7f4f3e319a429825008c8d46cc2cfbaf3bdce70972e5900df7e548df6967258b'
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
