# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python2-arcsi')
pkgver=3.1.6
pkgrel=1
pkgdesc="Atmospheric and Radiometric Correction of Satellite Imagery"
arch=('any')
url='https://bitbucket.org/petebunting/arcsi'
license=('GPL3')
makedepends=('python2-setuptools')
depends=('python2-rios' 'python2-py6s' 'python2-rsgislib')
options=(!emptydirs)
source=("$url/get/$pkgver.tar.bz2")
sha256sums=('6aafb66a924410d2cf9565b9e86ca47ce6d77e98a6b9f3f3759a47f58e18f3ee')
_hash=969f8aa973ab

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/petebunting-arcsi-$_hash" \
       -name "*.py" \
       -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/petebunting-arcsi-$_hash"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
