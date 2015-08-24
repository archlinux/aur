# Maintainer: Thomas Sarboni <max-k@post.com>

pkgbase=python-pydispatcher
_realname=PyDispatcher
pkgname=('python-pydispatcher' 'python2-pydispatcher')
pkgver=2.0.5
pkgrel=1
pkgdesc="provides loosely-coupled message passing between Python objects (signal senders and receivers)."
url="http://sourceforge.net/projects/${pkgbase}/"
arch=('any')
license=('GPL')
makedepends=('python-distribute' 'python2-distribute')
source=("http://downloads.sourceforge.net/project/${pkgbase}/${pkgbase}/${pkgver}/${_realname}-${pkgver}.zip")
md5sums=('1b9c2ca33580c2770577add7130b0b28')

prepare() {
  # We ship separated python{,2}-packaging packages.
  cp -a ${_realname}-${pkgver}{,-python2}
}

build() {
  # Build python 3 module
  cd "${srcdir}/${_realname}-${pkgver}"
  python3 setup.py build

  # Build python 2 module
  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-pydispatcher() {
  depends=('python')

  cd "${srcdir}/${_realname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pydispatcher() {
  depends=('python2>=2.3.3')

  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
