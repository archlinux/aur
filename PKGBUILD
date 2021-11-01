#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_name=viztracer
pkgver=0.14.2
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
b2sums=('6bec986caa0213d976a5100dc8bb33109e6f7c7863a07ae7deeca9c7721af9c96dd7c2d747479f86cc3cf5dd0a3f7b6c55a54fab690f02032e3c4289ae5156d6')

build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
