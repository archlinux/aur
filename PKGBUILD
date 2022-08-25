# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so
_pkgname=so
pkgver=0.4.9
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
sha256sums=('b6327268acf3e9652acebea49c1dfa5d855cf25db6c7b380f1a0a85737464a4a')


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
