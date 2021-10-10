#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.9.3
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
b2sums=('3fa65a6b8036773697f724a656e8e6dfed687bab31ecbf0bb472417788d66af8c26f3a5b70688f04b4b1e991b6a4b49db9cb3076970cf2cebcb00f1def3162db')

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
