#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.0.0
pkgrel=1
pkgdesc='Google Cloud API client core library'
url='https://github.com/googleapis/python-cloud-core'
arch=('any')
license=('APACHE')
depends=(
  'python'
  'python-google-api-core'
  'python-google-auth'
)
makedepends=('python-setuptools')
optdepends=(
  'python-grpcio: for grpc support'
)
# options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=('4e23864d2a4a42595fb494f8e7f7e000acec300d45ae6580771180f46d3431f01c223dc74e4d0ee354ece237c3a8d5b8b891b5be30adc57fef6c6cc6d2a4e9e2')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
