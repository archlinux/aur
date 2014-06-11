# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-apt
_python=python
pkgver=0.9.3.7
pkgrel=1
pkgdesc="Python binding of libapt-pkg"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/python-apt"
license=('GPL2')
depends=('python' 'apt>=1.0.4')
makedepends=('python-distutils-extra')
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$pkgname/${pkgname}_$pkgver.tar.xz
fix-pydebug.patch)
sha256sums=('53ae9e40de02285bde3e57b62abf20aec37bebaff3ae96880873a55efe546215'
            '8a652b45fc4cdb27d672c355858813678908a8b6ab6a8dde8b843193eb960646')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
  patch -N -p1 < ../fix-pydebug.patch
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
