# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_name=certbuilder
pkgname=python-certbuilder
pkgver=0.14.2
pkgrel=3
pkgdesc="Python library for generating and signing X.509 certificates"
url="https://github.com/wbond/certbuilder"
arch=(any)
license=(custom:MIT)
depends=(python python-asn1crypto python-oscrypto)
makedepends=(python-build python-installer)
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/wbond/${_name}/${pkgver}/LICENSE")
sha256sums=('56a8aee8ed31a211678647797dfdcdc85ec25d5d1bb1515e44ebae45cce363f9'
            '3ef40aca4f8f13ab0431c203148085a228c85ec64f30d6a06438f304552e958f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../$pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
