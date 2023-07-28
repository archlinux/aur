# Maintainer: Pouyan Heyratpour <pouyan@janstun.com>

pkgname=polywatch-git
pkgver=1.1.1
pkgrel=2
pkgdesc="File change watcher with filter & rate limit feature which run command(s) when file change events happen"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=()
makedepends=('go' 'goreleaser')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/archive/v${pkgver}.tar.gz)
md5sums=('a8477e7de275c826eb108871f7c40026')
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