# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=synapse-admin
pkgver=0.10.4
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache License 2.0')
makedepends=('nodejs' 'yarn')
optdepends=('nginx: reverse-proxy')
url="https://github.com/Awesome-Technologies/synapse-admin"
#source=("$pkgname-$pkgver.tar.gz::https://github.com/Awesome-Technologies/synapse-admin/archive/refs/tags/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Awesome-Technologies/synapse-admin.git#tag=$pkgver")
sha512sums=('0ca69006e44747a5e0aa70a1292fa2ad430b0884476cb8f8d8d5ea0be8b6d5015b3db97aadb27a2fc58ff057f27967b79c85e754f4d3fcb11e4114c1b3033e71')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  yarn install
  #  if you need to change homepage location: yarn build --base=/your-location
  yarn build --base=./
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}/"
}
