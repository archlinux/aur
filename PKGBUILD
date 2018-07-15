# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='harvest'
pkgver=0.4
pkgrel=1
pkgdesc='Tool to sort large collections of files according to common typologies'
arch=('any')
url='https://github.com/dyne/harvest'
license=('GPL3')
depends=('zsh')
source=(https://files.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        https://files.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('6a2de69e5ac5d7a3c79c2f27ceae52f4c8386fa648b1c8521cf6925b09b7334429b95f3352adba842e82b8f66214bd7b74f479fad96bc5df08a2d11e103419d8'
            '1277ff4d225867eb01c7e1b05c7a44bc9d82b987df720052509f457d546e6c3fa96338e02f3e48e84e1b91cb03cf3de162cd7fe599bb145d830a7f1df8dcd176')
_prefix=usr/

# The public key is found at https://keybase.io/jaromil
# gpg --recv-keys 6113D89CA825C5CEDD02C87273B35DA54ACB7D10
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  sed -i -e "s|/usr/local/share/harvest|/${_prefix}/share/harvest|" harvest
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -v -d "${pkgdir}/${_prefix}bin"
  make PREFIX="${pkgdir}/${_prefix}" install
}
