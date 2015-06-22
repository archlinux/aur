# Maintainer: William Di Luigi <williamdiluigi@gmail.com>
#
# https://github.com/wil93/aur/tree/master/cms

pkgname=cms
pkgver=1.2.0
pkgrel=2
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest."
arch=('any')
url="http://cms-dev.github.io/"
license=('AGPL3')
depends=(
  'postgresql' 'postgresql-libs' 'python2' 'python2-setuptools'
  'python2-tornado' 'python2-psycopg2' 'python2-sqlalchemy' 'python2-psutil'
  'python2-netifaces' 'python2-crypto' 'python2-pytz' 'python2-six'
  'iso-codes' 'shared-mime-info' 'python2-beautifulsoup3' 'python2-mechanize'
  'python2-mock' 'python2-requests' 'python2-werkzeug' 'python2-gevent'
  'python2-coverage' 'libcgroup' 'patool-py2'
)
optdepends=(
  'fpc: support for Pascal submissions'
  'sgi-stl-doc: support for STL documentation inside the contest'
  'python2-yaml: support for cmsMake (for tasks in the "italian format")'
)
conflicts=('cms-git')

source=(
  "https://github.com/cms-dev/cms/releases/download/v$pkgver/v$pkgver.tar.gz"
  'cms.patch'
)
sha256sums=(
  'cc8e1c916fa589493f156cf318efb301e958c4c9c30c9c22f3fb5fbe23219c6c'
  'df764495ec4cc1020d52fe12e25299d9c30da453a9b8cd6199fb060b6082e19c'
)

prepare() {
  cd "cms"
  patch -p1 -i $srcdir/cms.patch
  sed "s|MAKEPKG_INSTALL_ROOT|$pkgdir|g" -i setup.py
}

build() {
  cd "cms"
  python2 setup.py build
}

package() {
  cd "cms"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
