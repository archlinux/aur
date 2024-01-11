# Maintainer: Pavel Poronko <warzgibz at gmail dot com>

pkgname='marten'
pkgver='0.3.4'
pkgrel=1
pkgdesc='A Crystal command-line tool for working with Marten web framework applications'
arch=("x86_64")
url='https://github.com/martenframework/marten'
license=('MIT')
depends=('crystal' 'shards')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('050ffa9722a4cfce0c8fc032e6754a1a7aa318f1746565eafa1974e0e9774789')
provides=('marten')
build() {
  cd "marten-${pkgver}"

  # Install dependencies
  PATH="/usr/bin" shards install

  # Build marten cli
  PATH="/usr/bin" crystal build src/marten_cli.cr -o bin/${pkgname} --progress --release --no-debug
}

package() {
  cd "marten-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
