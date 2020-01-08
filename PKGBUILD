# Maintainer: Jose Riha <jose1711 gmail com>

pkgbase=python-mediafire
pkgname=('python-mediafire' 'python2-mediafire')
_module=mediafire
pkgver=0.6.0
pkgrel=2
pkgdesc="Python MediaFire client library"
url="https://github.com/MediaFire/mediafire-python-open-sdk"
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d9182785856b858b8d7896740f0dbb012856a81e00132812bffbf0e344884d6b')

prepare() {
  cd "${srcdir}/${_module}-${pkgver}"
  sed -i '/from pip\.req import/s/from pip\.req/from pip._internal.req/' setup.py
}

build_python-mediafire() {
  makedepends=('python-setuptools')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package_python-mediafire() {
  depends=('python' 'python-requests-toolbelt')
  conflicts=('python-mediafire-git')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

build_python2-mediafire() {
  makedepends=('python2-setuptools')
  cd "${srcdir}/${_module}-${pkgver}"
  python2 setup.py build
}

package_python2-mediafire() {
  depends=('python2' 'python2-requests-toolbelt')
  conflicts=('python2-mediafire-git')
  cd "${srcdir}/${_module}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
