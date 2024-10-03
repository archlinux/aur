# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so
_pkgname=so
pkgver=0.4.10
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
sha256sums=('36d8bc53b9c05e242fd4c9ba8ae447fae6c4a35d8c7e071f8994a7c0f07c225d')

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
