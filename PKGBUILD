#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_name=viztracer
pkgver=0.14.5
pkgrel=1
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url="https://github.com/gaogaotiantian/$_name"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
  'python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('960dc934e9b0d674a572bf749aadcbfa5575793deae43152f6f6366cea5608eed2a4d0c88660e3a865d4d930117c7cfb8308432cb68ada905ced62efaf4f4872')

build() {
  cd "$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
