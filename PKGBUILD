# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=slackclient
pkgbase='python-slackclient'
pkgname=('python-slackclient' 'python2-slackclient')
pkgver=1.1.3
pkgrel=2
pkgdesc="Python Slack API clients for Web API and RTM API"
arch=('any')
url="https://pypi.python.org/pypi/slackclient"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/6b/66/c421967368e8be43c5e09f50ae10f4d730c20e87d7e81841bc79a0bebcb2/slackclient-1.1.3.tar.gz)
sha256sums=('146f5b1b7f4761fc8da8ac102c0f1fdc6f00a458c0b8349e156f93f7fef817f7')

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
