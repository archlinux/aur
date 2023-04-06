# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anthony25 <Anthony Ruhier>

pkgname=python-selectors2
pkgver=2.0.2
pkgrel=6
arch=('any')
pkgdesc='Backported, durable, and portable selectors.'
url='https://github.com/SethMichaelLarson/selectors2'
license=('MIT')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/SethMichaelLarson/selectors2/archive/$pkgver.tar.gz
        python310.patch)
sha256sums=('43e80168bec134ada813d4126b8eac071450bad8ec1bbdd91ec6481050dbc87e'
            '3a05a9b4c9b5a48db0c3c9d961badcb0fe7466f3f0fb12063e8ebc53be9a8041')

prepare() {
  cd "${srcdir}"/selectors2-$pkgver
  patch -Np1 -i ../python310.patch
}

package() {
  cd "${srcdir}"/selectors2-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
