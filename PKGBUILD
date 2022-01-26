#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.2.2
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
b2sums=('1dd45406b6e1811f0531bd396128193b220a9f01895024997daf9ce29273ee4945d188ff227648965271833ed27997c11b9274fbba5a657110d773c7a4a39563')

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
