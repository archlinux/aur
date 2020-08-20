# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Michal Marek <reqamst at gmail dot com>
# Contributor: Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>

pkgname=python-cssutils
pkgver=1.0.2
pkgrel=5
pkgdesc="A CSS Cascading Style Sheets library for Python"
arch=('any')
url="http://cthedot.de/cssutils/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pbr')
source=("https://files.pythonhosted.org/packages/source/c/cssutils/cssutils-${pkgver}.tar.gz")
md5sums=('dc66d96c2d78f1687f59ac412fe9d318')

prepare() {
  cd cssutils-${pkgver}

  # don't pin old versions of testrunner
  sed -i "/tests_require/{s/pbr < 1\.7\.0/pbr/;s/'mock',//}" setup.py
  sed -i 's/import mock/from unittest import mock/' src/cssutils/tests/*.py
}

build() {
  cd cssutils-${pkgver}

  2to3 --no-diffs -nw src
  python setup.py build
}

check() {
  cd "${srcdir}/cssutils-${pkgver}"

  python3 setup.py test
}

package() {
  cd "cssutils-${pkgver}"

  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
