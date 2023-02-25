#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-google-cloud-texttospeech
_name=google-cloud-texttospeech
pkgver=2.14.1
pkgrel=1
pkgdesc='A google cloud speech api for python to convert text to audio.'
url='https://github.com/googleapis/python-texttospeech'
arch=('any')
license=('Apache')
depends=(
  'python-libcst'
  'python-proto-plus'
  'python-google-api-core'
  # 'python-google-cloud-core'
  'python-grpcio'
  'python-packaging'
)
makedepends=(
  'python'
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('14cf8ab05387283ef97914bd6b0d29fbc24337cf7cd38561c4d5471969a51e3d5b2b974ca824f6fe654ab540b8a36d6415396ca417b43b556b20309cb204df96')

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
  # export PYTHONHASHSEED=0
  # python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
