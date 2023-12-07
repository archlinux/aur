# Maintainer: Pouyan Heyratpour <me@pouyan.dev>

pkgname=polywatch-git
pkgver=1.1.0
pkgrel=1
pkgdesc="File change watcher with filter & rate limit feature which run command(s) when file change events happen"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=()
makedepends=('go' 'goreleaser')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/archive/v${pkgver}.tar.gz)
md5sums=('f4144551a9561be4c3639e30d541529f')
provides=('polywatch')
conflicts=('polywatch')

build() {
  cd "${pkgname%-git}-${pkgver}"

  goreleaser build --snapshot --clean --single-target -o dist/polywatch
}

package() {
  cd "${pkgname%-git}-${pkgver}"

  install -Dm 755 dist/polywatch -t "${pkgdir}/usr/bin"
}