# Maintainer: qlrddev <qlrddev@gmail.com>

pkgname=gossip-bin
pkgver=0.13
pkgrel=0
epoch=1
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
  "README.upgrading.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/README.upgrading.txt"
  "changelog.txt::https://github.com/mikedilger/gossip/releases/download/v${pkgver}.${pkgrel}/changelog-${pkgver}.${pkgrel}.txt"
  "gossip.png::https://raw.githubusercontent.com/mikedilger/gossip/c437e3ebf30ff168395bcdcb94cab7c88a5d0543/logo/gossip.png"
)
sha256sums=('e56a0164a951f9269de6c24f9d00613faebf7d2edb140217909e62fdaea7cfbb'
            '25155c43f1b12dce73d4da04dff263995976cfc02a9251e415e2f1c7cdf0da5b'
            '32edc1a7ad1dccbabc174e4959358a779bf4cce2e938481c7574d1b99ece54aa'
            '5e3da4edc740244d454a36f7d77f38d100ba68eafab4ce9c529eda3b40a59121'
            '05048531f68164055516624327f8154d9bf3256b3ba52097de554b4c4fc9be99'
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
  install -Dm644 "${srcdir}/README.upgrading.txt" -T "${pkgdir}/usr/share/doc/gossip/README.upgrading.txt"
  install -Dm644 "${srcdir}/gossip.png" -T "${pkgdir}/usr/share/pixmaps/gossip.png"  
}
