#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.2.1
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
b2sums=('b72cd7d08412320b868b9d35e6091274256242c4e2e602fbce7a5203a50eb7f6f0289f26b5973a2fb7276b98630b2dcfbde072129430c8b70d2ef6c220594f82')

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
