# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>

_pkgbase=ketesa
pkgname=${_pkgbase}-git
pkgver=1.2.0.r4.gf4077fb
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin (Synapse Admin fork)"
arch=(any)
url=https://github.com/etkecc/ketesa
license=('Apache-2.0')
makedepends=(npm yarn git)
optdepends=('nginx: to serve the web application')
provides=($_pkgbase)
conflicts=(ketesa)
replaces=(synapse-admin-etke-git)
source=("${_pkgbase}::git+${url}.git")
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
