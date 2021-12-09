# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=lucky
pkgver=0.29.0
pkgrel=1
pkgdesc='A Crystal command-line tool for generating new Lucky Web Applications'
arch=('x86_64')
url='https://github.com/luckyframework/lucky_cli'
license=('MIT')
depends=('crystal'
         'shards')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('45fdb9ab57d5303328f586711ebede4a0b6f61a9d28b11808731eac045a3c511')
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
