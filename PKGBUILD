# Maintainer: John Regan <john@jrjrtech.com>

pkgname=pydio-sync-git
pkgrel=1
pkgver=r504.dd770f8
pkgdesc="Pydio Sync Client"
arch=('any')
url="http://pyd.io"
license=('GPL3')
depends=(
    'python2-pyzmq'
    'python2-appdirs'
    'python2-xmltodict'
    'python2-yaml'
    'python2-argh'
    'python2-keyring'
    'python2-pathlib'
    'python2-pathtools'
    'python2-pydispatcher'
    'python2-aniso8601'
    'python2-requests'
    'python2-watchdog'
    'python2-cffi'
    'python2-flask'
    'python2-flask-restful'
    'python2-six'
    'python2-pytz'
         )
# TODO
# python2-pytz is actually a req of python2-flask-restful
# python2-aniso8601 is a req of python2-flask-restful
makedepends=('git'
             'python2-setuptools')
provides=('pydio-sync')
conflicts=('pydio-sync')
source=('git://github.com/pydio/pydio-sync.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pydio-sync"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pydio-sync"
  # this isn't god-damn nodejs
  sed -i 's/==/>=/' requirements.txt
  python2 setup.py build
}

package() {
  cd "${srcdir}/pydio-sync"
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
