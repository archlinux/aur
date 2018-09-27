# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Thor K. H. <thor alfakrøll roht dott no>

set -u
_pkgname='csvkit'
pkgname="${_pkgname}-git"
pkgver=1.0.3.r35.g6d280f5
pkgrel=1
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=('any')
url='http://csvkit.readthedocs.org'
license=('MIT')
depends=(
  'python'
  'python-agate' # >= 1.2.2
  'python-agate-dbf' # >= 0.1.0
  'python-agate-excel' # >= 0.1.0
  'python-agate-sql'
  'python-dateutil' # >=2.2
  'python-six' # >=1.6.1
  'python-sqlalchemy' # >=0.9.3
)
makedepends=(
  'git'
  'python-setuptools'
  'python-pip'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir='csvkit'
source=('csvkit::git://github.com/wireservice/csvkit.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  # Quick and dirty fix until the author officially supports dateutil>=2.2
  # (see https://github.com/onyxfish/csvkit/issues/370)
  #sed -i 's/python-dateutil==2.2/python-dateutil>=2.2/' setup.py
  #sed -i 's/openpyxl==2.2.0-b1/openpyxl>=2.2.0-b1/' setup.py
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  python setup.py build
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  python setup.py install --root="${pkgdir}" --optimize=1
  set +u
}
set +u
