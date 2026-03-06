# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=synapse-admin
pkgver=0.11.2
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache License 2.0')
makedepends=('nodejs' 'yarn')
optdepends=('nginx: reverse-proxy')
url="https://github.com/Awesome-Technologies/synapse-admin"
#source=("$pkgname-$pkgver.tar.gz::https://github.com/Awesome-Technologies/synapse-admin/archive/refs/tags/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Awesome-Technologies/synapse-admin.git#tag=$pkgver")
sha512sums=('f362f5e746890ca87f407d5aa0140c86bfcd9fd333672f50d74f6460f890fd65e18915bcb48bcecea113846f933d8e498b9d2a282c35132e16bde49170bab64b')

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
