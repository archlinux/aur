# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.12
pkgrel=0
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
sha256sums=('d4b474854aaad46778ffb3a8f6674103384579108d5b759019831d9e35a8bcb8'
            '8a8543ebe0203fa8597bfcf70e7841f6fb66367358ff6180be692d4d724def70'
            'ace36c7563bae04f03d25b04e6f28e781874e7fca509f25345c08651a1c921fa'
            'd9fb7281fe5c8350a767b8569821a9008ac0b7025782127fa985b93be8034a6a'
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
