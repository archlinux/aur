#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.8.0
pkgrel=1
pkgdesc='A google cloud speech api for python to convert audio to text.'
url='https://github.com/googleapis/python-speech'
arch=('any')
license=('Apache')
depends=(
  'python-libcst'
  'python-proto-plus'
  'python-google-api-core'
  'python-google-cloud-core'
  'python-packaging'
)
makedepends=(
  'python'
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('617f7c2797a91b5ae42e618d578d11dde4dc427968c8f55362e28d53bfab15671d6db681bfa77b45a501b1bb9fb233fc47c9914aa0e99c253e2d3fdc6f26adb5')

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
