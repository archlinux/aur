# Maintainer: Christopher Arndt <chris at chrisarndt.de>

pkgbase=('python-jack-client')
pkgname=('python-jack-client' 'python2-jack-client')
_name='JACK-Client'
pkgver='0.4.4'
pkgrel=1
pkgdesc="JACK Audio Connection Kit (JACK) Client for Python"
url="http://jackclient-python.rtfd.org/"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/j/jack-client/JACK-Client-${pkgver}.tar.gz")
md5sums=('75cbe4c6ef24eb3c9a0bcb44174cd072')

prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-jack-client() {
  depends+=('python-cffi')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-jack-client() {
  depends+=('python2-cffi')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
