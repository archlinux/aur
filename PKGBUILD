#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.9.1
pkgrel=1
pkgdesc='A google cloud speech api for python to convert audio to text.'
url='https://github.com/googleapis/python-speech'
arch=('any')
license=('Apache')
depends=(
  'python-libcst'
  'python-proto-plus'
  'python-google-api-core'
  # 'python-google-cloud-core'
  'python-packaging'
)
makedepends=(
  'python'
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('dd0c34ade50291832de1812f89b2ce42a33826693ca01f835450f47f1a5a1808adb4cc11c2cd7c46b4ceafd9d746747c3fdc78226eaabf44beabbdb1fcae7e89')

build() {
  cd "$_name-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
