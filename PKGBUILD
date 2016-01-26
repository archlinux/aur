# Maintainer: mawcomw <mawcomw@gmail.com>

_pkgname=interruptingcow
pkgbase=python-${_pkgname}
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.6
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('CUSTOM')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/i/${_pkgname}/${_pkgname}-0.6.tar.gz")
md5sums=('f31b238e72ce40239dd2275ccb73945f')

prepare() {
   cp -r ${_pkgname}-${pkgver} python2-${_pkgname}-${pkgver}
}

build() {
   cd $srcdir/${_pkgname}-${pkgver}
   python setup.py build

   cd $srcdir/python2-${_pkgname}-${pkgver}
   python2 setup.py build
}

package_python-interruptingcow() {
   depends=('python')
   pkgdesc="Python3 interruptingcow library"

   cd ${_pkgname}-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-interruptingcow() {
   depends=('python2')
   pkgdesc="Python2 interruptingcow library"

   cd python2-${_pkgname}-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
