# Maintainer: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname=csvkit-git
pkgver=0.9.1.gbf18815
pkgrel=1
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=('any')
url="http://csvkit.readthedocs.org"
license=('MIT')
makedepends=('git')
depends=('python' 'python-xlrd>=0.9.2' 'python-dateutil>=2.0' 'python-sqlalchemy>=0.9.3' 'python-openpyxl>=2.0.3' 'python-six>=1.6.1')
makedepends=('git')
md5sums=('SKIP')
source=('csvkit::git://github.com/onyxfish/csvkit.git')

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
  python setup.py install --root="$pkgdir/"
}

