# Maintainer: envolution
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-mecab
_pkgname=mecab-python3
pkgver=1.0.9
pkgrel=1
pkgdesc="Morphological Analysis Tool - Python3 interface"
arch=('x86_64' 'i686')
url="http://taku910.github.io/mecab/"
license=('BSD' 'LGPL2.1' 'GPL2')
depends=('python' 'mecab' 'mecab-ipadic')
makedepends=('python-setuptools' 'python-wheel' 'python-pip' 'git' 'swig')
source=("git+https://github.com/SamuraiT/mecab-python3.git#tag=v${pkgver}")
sha1sums=('810fd4d5bf17736d903c738f6c14a4d93bafeb44')

build() {
  cd "${srcdir}/${_pkgname}"
  #  python setup.py build
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  #  python setup.py install --root=${pkgdir}
  python -m installer --destdir=${pkgdir} dist/*.whl
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
# vim:set ts=2 sw=2 et:
