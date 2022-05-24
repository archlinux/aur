#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-astpretty
_name=astpretty
pkgver=3.0.0
pkgrel=1
pkgdesc="Pretty print the output of python stdlib 'ast.parse'."
arch=('any')
url="https://github.com/asottile/astpretty"
license=('MIT')
depends=('python')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('cb5cba1efbd3b44963271c80410fba47caa65d8cf0122bbf25a5472b9c415a17e0a4132b0236be4cee7225a77aaa122c9a9fbf4abd61865630786fb63e67d649')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -Dm644 LICENCE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
