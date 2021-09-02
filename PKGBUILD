#!/bin/bash

# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname='python-pydistmesh'
_name='PyDistMesh'
pkgver=1.2
pkgrel=2
pkgdesc="PyDistMesh: A Simple Mesh Generator in Python."
arch=('x86_64')
url="https://github.com/bfroehle/pydistmesh"
license=('custom')
depends=(
  'python'
  'python-matplotlib'
  'blas'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('b6698693cfd58b9927ce6a598d96ad73e63bb5cd7c30c2601c4988c45b9147982b07557e4864414d47565a87cf2889c2fbf1679690e0fe5834be93a48c1453ba')

build() {
  cd "$srcdir/$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
