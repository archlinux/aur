# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=synapse-admin
pkgver=0.11.0
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache License 2.0')
makedepends=('nodejs' 'yarn')
optdepends=('nginx: reverse-proxy')
url="https://github.com/Awesome-Technologies/synapse-admin"
#source=("$pkgname-$pkgver.tar.gz::https://github.com/Awesome-Technologies/synapse-admin/archive/refs/tags/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Awesome-Technologies/synapse-admin.git#tag=$pkgver")
sha512sums=('d1934db1f234d3337433d32334042c10afc8b07601c5d1346ee403c56366f8aadd4bcd65a443b97d09d2c11641f8fd4bc2caa0e0d6a07f54c9d55f76534048f9')

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
