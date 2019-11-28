# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgbase=python-singleton-decorator
pkgname=('python-singleton-decorator' 'python2-singleton-decorator')
pkgver=1.0.0
pkgrel=1
pkgdesc='A testable decorator that allows you to easily create singleton objects"'
arch=('any')
url='https://pypi.org/project/singleton-decorator/'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=(
  "https://files.pythonhosted.org/packages/33/98/a8b5c919bee1152a9a1afd82014431f8db5882699754de50d1b3aba4d136/singleton-decorator-${pkgver}.tar.gz"
)
sha256sums=(
  '1a90ad8a8a738be591c9c167fdd677c5d4a43d1bc6b1c128227be1c5e03bee07'
)

prepare() {
  cp -a singleton-decorator-${pkgver}{,-py2}
  find "singleton-decorator-${pkgver}-py2" -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "${srcdir}/singleton-decorator-${pkgver}"
  python setup.py build

  cd "${srcdir}/singleton-decorator-${pkgver}-py2"
  python2 setup.py build
}

package_python-singleton-decorator() {
  cd "${srcdir}/singleton-decorator-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-singleton-decorator() {
  cd "${srcdir}/singleton-decorator-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
