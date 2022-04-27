#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.3.0
pkgrel=2
pkgdesc='Google Cloud API client core library'
url='https://github.com/googleapis/python-cloud-core'
arch=('any')
license=('APACHE')
depends=(
  'python'
  'python-google-api-core'
  'python-google-auth'
)
makedepends=(
  'python-setuptools'
  'python-wheel'
  'python-installer'
  'python-build'
)
optdepends=(
  'python-grpcio: for grpc support'
)
# options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=('601d0cf8c5f0efdf360e482fc53a11aa4f3ed846b2777c59cf14c2006ecc3466bfb66fd8d6bd608562dc5fb9c0b07a143807b54d861b048a414d2a8439255331')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  # export PYTHONHASHSEED=0
  # python setup.py build
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
