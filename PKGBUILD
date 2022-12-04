# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_name=ocspbuilder
pkgname=python-ocspbuilder
pkgver=0.10.2
pkgrel=3
pkgdesc="Python library for generating OCSP requests and responses"
url="https://github.com/wbond/ocspbuilder"
arch=(any)
license=(custom:MIT)
depends=(python python-asn1crypto python-oscrypto)
makedepends=(python-build python-installer)
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/wbond/${_name}/${pkgver}/LICENSE")
sha256sums=("945629537ac6d6960a7413fd32fc49448a442f9dfd87f6de5c239e89ed853a0d"
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
