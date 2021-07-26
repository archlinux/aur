#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.5.1
pkgrel=1
pkgdesc='A google cloud speech api for python to convert audio to text.'
url="https://github.com/googleapis/python-speech"
arch=('any')
license=('Apache')
depends=(
  'python-libcst'
  'python-proto-plus'
  'python-google-api-core'
)
makedepends=(
  'python'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('b2a5d28daacc41576b38014c193145fd170f50b1c16359d61d06207f8f78f603b05402eb347caf019880524362863523e08a635886c2c20c893f5138a6ea7296')

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
