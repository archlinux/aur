# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=pystray
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.15.0
pkgrel=1
arch=(any)
license=('GPL')
pkgdesc="Provides systray integration."
url="https://github.com/moses-palmer/pystray"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-sphinx' 'python2-sphinx')
source=("https://github.com/moses-palmer/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('889730ef8b7967f60538bf1354fb9864c9136d4c5700c2eab411164f1878938a0c2c2d0946c9df58892f3d3a27832316f5413a462741166b81f49f9d915dfc1f')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-pystray() {
  depends=('python-pillow' 'python-six' 'python-xlib')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pystray() {
  depends=('python2-pillow' 'python2-six' 'python2-xlib')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

