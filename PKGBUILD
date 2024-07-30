# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=synapse-admin
pkgver=0.10.3
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache License 2.0')
makedepends=('nodejs' 'yarn')
optdepends=('nginx: reverse-proxy')
url="https://github.com/Awesome-Technologies/synapse-admin"
#source=("$pkgname-$pkgver.tar.gz::https://github.com/Awesome-Technologies/synapse-admin/archive/refs/tags/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Awesome-Technologies/synapse-admin.git#tag=$pkgver")
sha512sums=('SKIP')

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
