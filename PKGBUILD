# Maintainer: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs
_gitname=GDriveFS
pkgver=0.14.8
pkgrel=2
pkgdesc='A complete FUSE adapter for Google Drive'
url='https://github.com/dsoprea/GDriveFS'
depends=('python2' 'python2-fusepy' 'python2-gevent' 'python2-google-api-python-client'
         'python2-greenlet' 'python2-httplib2' 'python2-dateutil' 'python2-six' 'python2-wsgiref')
makedepends=('python2-distribute')
license=('GPL2')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7c7f0f8f3b7079f7823c0d27c751f3ae43c0ca0e7f6bbdf93da6dc29150890b5')

build() {
  cd ${srcdir}/${_gitname}-${pkgver}

  # Fix for multi threaded (issue 132)
  patch -p1 < ../../pull_147.patch

  # Add support to utf8 instead of ASCII
  patch -p1 < ../../pull_154_utf8.patch

  # Fix for oauth2client.util library
  patch -p1 < ../../issue_166.patch

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:
