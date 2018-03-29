# Maintainer: j605
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgbase=pipsi
pkgname=('pipsi' 'pipsi2')
pkgver=0.9
pkgrel=3
pkgdesc='Wraps pip and virtualenv to install scripts'
arch=('any')
url='https://github.com/mitsuhiko/pipsi/'
license=('BSD')
makedepends=('python2' 'python' 'python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pipsi/pipsi-${pkgver}.tar.gz")

# this multipackage trick was copied from community/python-perf
prepare() {
  cp -a pipsi-${pkgver}{,-py2}
  sed 's|pipsi=|pipsi2=|' -i pipsi-${pkgver}-py2/setup.py
}

build() {
  (cd pipsi-${pkgver}
    python setup.py build
  )
  (cd pipsi-${pkgver}-py2
    python2 setup.py build
  )
}

package_pipsi(){
  depends=('python' 'python-click' 'python-virtualenv')
  cd pipsi-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/pipsi/LICENSE"
}

package_pipsi2() {
  depends=('python2' 'python2-click' 'python2-virtualenv')
  cd pipsi-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/pipsi2/LICENSE"
}
sha256sums=('688b688cc8a7a76612c0d4d1839aaef98ece8382d4382b9d8b6f0caa65f0ed34')
