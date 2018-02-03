# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=slackclient
pkgbase='python-slackclient'
pkgname=('python-slackclient' 'python2-slackclient')
pkgver=1.1.2
pkgrel=2
pkgdesc="Python Slack API clients for Web API and RTM API"
arch=('any')
url="https://pypi.python.org/pypi/slackclient"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/08/6e/c84dcf7c18c0a79c17a3dec971bcfa746ea1e23d4f41ba1de7eead203266/slackclient-1.1.2.tar.gz)
sha256sums=('2e5840eba5af71487803b4eb8427ba19e1347fae6ed25cff53e0a6ea6c6832f5')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-slackclient() {
  depends=(
    'python2'
    'python2-websocket-client'
    'python2-requests'
    'python2-six'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-slackclient() {
  depends=(
    'python'
    'python-websocket-client'
    'python-requests'
    'python-six'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
