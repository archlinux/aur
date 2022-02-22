# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so
_pkgname=so
pkgver=0.4.6
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
sha256sums=('47a3cf5cef9d87dea223ef1c8fae3cf8c2ae0673d9eb4c8d73d733ce8ff45619')


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
