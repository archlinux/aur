# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

_pkgbase=pylint
pkgname=python-pylint-1.4.4
pkgver=1.4.4
pkgrel=1
pkgdesc="Analyzes Python code looking for bugs and signs of poor quality"
arch=('any')
url="http://pylint.org"
license=('GPL')
depends=('python-astroid' 'python-setuptools' 'python-six')
makedepends=('mercurial')
optdepends=('tk: Pylint GUI')
provides=('python-pylint=1.4.4')
conflicts=('python-pylint')
source=("hg+https://felixonmars@bitbucket.org/logilab/pylint#tag=pylint-$pkgver")
sha1sums=('SKIP')

build() {
  cd ${_pkgbase}
  python setup.py build
}

check() {
  cd ${_pkgbase}
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python -Wi -m unittest discover -s pylint/test/ -p *test_*.py || warning "Tests failed"
}

package() {
  cd ${_pkgbase}

  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1

  install -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/* "${pkgdir}/usr/share/man/man1"
}
