# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=gdrivefs
_gitname=GDriveFS
pkgver=0.14.3
pkgrel=7
pkgdesc="A complete FUSE adapter for Google Drive"
url="https://github.com/dsoprea/GDriveFS"
depends=('python2' 'python2-fusepy' 'python2-gevent' 'python2-google-api-python-client' 'python2-greenlet' 'python2-httplib2' 'python2-dateutil' 'python2-six' 'python2-wsgiref')
makedepends=('python2-distribute')
license=('GPL2')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('bbd8a566aab6181df606c4c86f75552f9d59dbe41040fe0ee0d4a9c515ae9f05')

build() {
  cd ${srcdir}/${_gitname}-${pkgver}
  patch -p1 < ../../pull_134.patch
  patch -p1 < ../../pull_147.patch
  patch -p1 < ../../pull_154_utf8.patch
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:
