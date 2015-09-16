# Maintainer: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
gittag=0.9.1
gitrev=gbf18815
pkgname=csvkit-git
pkgver=$gittag.$gitrev
pkgrel=2
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=('any')
url="http://csvkit.readthedocs.org"
license=('MIT')
makedepends=('git')
depends=('python' 'python-xlrd>=0.9.2' 'python-dateutil>=2.0' 'python-sqlalchemy>=0.9.3' 'python-openpyxl>=2.0.3' 'python-six>=1.6.1')
makedepends=('tar' 'gzip')
md5sums=('5708394caa93408254a15269a83cfeed')
source=("csvkit-$gittag.tar.gz::https://github.com/onyxfish/csvkit/archive/$gittag.tar.gz")

build() {
  cd "$srcdir/csvkit-$gittag"
  # Quick and dirty fix until the author officially supports dateutil>=2.2
  # (see https://github.com/onyxfish/csvkit/issues/370)
  sed -i 's/python-dateutil==2.2/python-dateutil>=2.2/' setup.py
  sed -i 's/openpyxl==2.2.0-b1/openpyxl>=2.2.0-b1/' setup.py
}

package() {
  cd "$srcdir/csvkit-$gittag"
  python setup.py install --root="$pkgdir/"
}

