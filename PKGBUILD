# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=slackclient
pkgbase='python-slackclient'
pkgname=('python-slackclient' 'python2-slackclient')
pkgver=1.2.1
pkgrel=1
pkgdesc="Python Slack API clients for Web API and RTM API"
arch=('any')
url="https://pypi.python.org/pypi/slackclient"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('e9de0c893e8c5473107f5927ae1e543d35246f0c834f5e86470b22b762211577')

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
