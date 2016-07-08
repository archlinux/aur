# Maintainer: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Thor K. H. <thor alfakrøll roht dott no>

pkgname=csvkit-git
pkgver=0.9.1.r319.gea1e7bb
pkgrel=4
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=('any')
url="http://csvkit.readthedocs.org"
license=('MIT')
depends=(
    'python'
    'python-dateutil' # >=2.2
    'python-sqlalchemy' # >=0.9.3
    'python-six' # >=1.6.1
    'python-agate' # >= 1.2.2
    'python-agate-excel' # >= 0.1.0
    'python-agate-dbf' # >= 0.1.0
)
makedepends=(
    'git'
    'python-setuptools'
    'python-pip'
)
md5sums=('SKIP')
source=('csvkit::git://github.com/wireservice/csvkit.git')

pkgver() {
  cd "$srcdir/csvkit"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/csvkit"
  # Quick and dirty fix until the author officially supports dateutil>=2.2
  # (see https://github.com/onyxfish/csvkit/issues/370)
  sed -i 's/python-dateutil==2.2/python-dateutil>=2.2/' setup.py
  sed -i 's/openpyxl==2.2.0-b1/openpyxl>=2.2.0-b1/' setup.py
}

package() {
  cd "$srcdir/csvkit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

