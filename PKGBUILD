# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: mawcomw <mawcomw@gmail.com>

_pkgname=interruptingcow
pkgbase=python-${_pkgname}
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.8
pkgrel=4
arch=('any')
url="https://bitbucket.org/evzijst/interruptingcow"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/i/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('78162ad4fd78e5bcd353abff110dc32f')

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
   python setup.py install --skip-build --root="$pkgdir" --prefix=/usr --optimize=1

   install -Dm644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-interruptingcow() {
   depends=('python2')
   pkgdesc="Python2 interruptingcow library"

   cd python2-${_pkgname}-${pkgver}
   python2 setup.py install --skip-build --root="$pkgdir" --prefix=/usr --optimize=1

   install -Dm644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
