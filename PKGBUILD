# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so
_pkgname=so
pkgver=0.3.6
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
sha256sums=('6d2f541bb00dceb9163faf4cc44ff1bd39e07b46c35d6532e24b47d7ad6d47da')


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
