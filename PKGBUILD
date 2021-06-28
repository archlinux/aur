# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=streampager
pkgver=0.9.6
pkgrel=1
pkgdesc='A pager for command output or large files'
url='https://github.com/markbt/streampager'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markbt/streampager/archive/v${pkgver}.tar.gz")
sha256sums=('a6b186e5f16e5158520b900ce54c14027e9b8357849301b35bc4d0218f4ed7e5')
b2sums=('6385225cb10d106fdcf63db3ca2289a4b1ac6dca8dcc88ee125f4f841aeb9ba18178abdbc2c719ba5d1ec0aa23764e463355d51991812a9df38d46a2b48c4a09')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin" target/release/{sp,spp}

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
