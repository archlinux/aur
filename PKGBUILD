# Maintainer: Pouyan Heyratpour <me@pouyan.dev>

pkgname=medad-git
pkgver=1.0.0
pkgrel=2
pkgdesc="Content publisher - Converts Markdown documents to HTML files and uploads them to the server"
arch=('any')
url="https://pattack.github.io/medad/"
license=('GPL3')
depends=()
makedepends=('go' 'goreleaser')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pattack/medad/archive/v${pkgver}.tar.gz)
md5sums=('aa403b3920f0b59992e21e7925fbaaad')
provides=('medad')
conflicts=('medad')

build() {
  cd "${pkgname%-git}-${pkgver}"

  goreleaser build --snapshot --clean --single-target -o dist/medad
}

package() {
  cd "${pkgname%-git}-${pkgver}"

  install -Dm 755 dist/medad -t "${pkgdir}/usr/bin"
}