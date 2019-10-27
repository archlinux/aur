# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=pystray
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.14.4
pkgrel=2
arch=(any)
license=('GPL')
pkgdesc="Provides systray integration."
url="https://github.com/moses-palmer/pystray"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-sphinx' 'python2-sphinx')
source=("https://github.com/moses-palmer/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8c0da713ce5314137015d23c156de22054a44d4720be36a41ad1917bc694ffaed0b254b9473f67a26bf630e12d7fa71744410723927318280768efcfb752cd81')

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
