#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.1.0
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
b2sums=('9640036d0244d771b609d41d5c9995499ee76c56472812f7bb83d97897bc37cfe7c240568c3978247122886e7ad319b380cc6d9711c3c19032f723435f385877')

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
