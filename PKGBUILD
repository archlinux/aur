# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>

_pkgbase=synapse-admin-etke
pkgname=${_pkgbase}-git
pkgver=0.11.1.etke47.r9.g642667f
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin (etke.cc fork)"
arch=(any)
license=('Apache-2.0')
makedepends=(npm yarn git)
optdepends=('nginx: to serve the web application')
url=https://github.com/etkecc/synapse-admin
source=("${_pkgbase}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgbase}"
  yarn install
  # If you need to change homepage location: yarn build --base=/your-location
  yarn build --base=./
}

package() {
  cd "$srcdir/${_pkgbase}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/webapps/${_pkgbase}"
  cp -r dist/* "${pkgdir}/usr/share/webapps/${_pkgbase}/"
}
