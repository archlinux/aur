# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=lucky
pkgver=1.4.0
pkgrel=1
pkgdesc='A Crystal command-line tool for generating new Lucky Web Applications'
arch=('x86_64')
url='https://github.com/luckyframework/lucky_cli'
license=('MIT')
depends=('crystal'
         'shards')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('58084e4b8f8f83926c70d115a11529357fbe798adfbcafe863bd248a3595b489')
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
