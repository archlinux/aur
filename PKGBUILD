# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so
_pkgname=so
pkgver=0.4.8
pkgrel=1
pkgdesc="A terminal interface for StackOverflow"
arch=('any')
url="https://github.com/samtay/so"
license=('MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
provides=('so')
conflicts=('so-git' 'so-bin')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# obtain via makepkg -g
sha256sums=('11e37927b248824d8f2475b695168889afe0c14f9183cf2f31a9c0395d00dd98')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install binary
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"

  # install license
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
