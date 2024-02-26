# Maintainer: Pavel Poronko <warzgibz at gmail dot com>

pkgname='marten'
pkgver='0.4.1'
pkgrel=1
pkgdesc='A Crystal command-line tool for working with Marten web framework applications'
arch=("x86_64")
url='https://github.com/martenframework/marten'
license=('MIT')
depends=('crystal' 'shards')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('daa0b2b8032f4803a0dc5fae354c3d0ed4eafb210c8b50007af2707b808858cf')
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
