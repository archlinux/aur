#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_name=viztracer
pkgver=0.15.2
pkgrel=1
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url="https://github.com/gaogaotiantian/$_name"
license=('Apache')
depends=('python')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
optdepends=(
  'python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('de6bd3c4d03d263c3f4fa67207674471b076e1ce94a96733215d3b94d8a5f5a4cbdd670aaaf041750d7928bfbe5eef238e8e05e7c9a27342f3fa7b48e7e387d4')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
