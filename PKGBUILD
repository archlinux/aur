# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-attrdict
pkgname=('python-attrdict' 'python2-attrdict')
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="A library that provides mapping objects that allow their elements to be accessed both as keys and as attributes."
arch=('any')
url="https://github.com/bcj/attrdict"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('86aeb6d3809e0344409f8148d7cac9eabce5f0b577c160b5e90d10df3f8d2ad3')

prepare() {
  cp -a AttrDict-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/AttrDict-${pkgver}
  python setup.py build

  cd "${srcdir}"/AttrDict-${pkgver}-py2
  python2 setup.py build
}

package_python-attrdict() {
  cd AttrDict-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-attrdict() {
  cd AttrDict-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
