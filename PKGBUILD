#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.11.1
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
b2sums=('344d0fa6e6fa6057031444f0d8bddcfb179788e67b1d1b703e3395b4c3298a734afe893bcabd758236730204e586375b632c3092bb433348a1dac1bcba903685')

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
