# Maintainer: Andy Botting <andy@andybotting.com>

_module='munch'
pkgname=('python-munch' 'python2-munch')
pkgver='2.1.1'
pkgrel='2'
pkgdesc='A dot-accessible dictionary (a la JavaScript objects).'
arch=('any')
url='https://github.com/Infinidat/munch'
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("git+https://github.com/Infinidat/munch#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  py.test test_munch.py

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 py.test2 test_munch.py
}

package_python-munch() {
  depends=('python-six')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-munch() {
  depends=('python2-six')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
