# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=lucky
pkgver=1.0.0
pkgrel=1
pkgdesc='A Crystal command-line tool for generating new Lucky Web Applications'
arch=('x86_64')
url='https://github.com/luckyframework/lucky_cli'
license=('MIT')
depends=('crystal'
         'shards')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('45d9487461286f97d99168b10ace40e2b965d426a2c9093c30b4f729486a29a1')
provides=('lucky')
conflicts=('lucky-git')

build() {
  cd "lucky_cli-${pkgver}"

  # Install dependencies
  PATH="/usr/bin" shards install

  # Build lucky cli
  PATH="/usr/bin" shards build --progress --release --no-debug
}

package() {
  cd "lucky_cli-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
