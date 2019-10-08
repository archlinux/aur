# Maintainer: David Vogt <dave at winged dot ch>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

pkgname=fahrplan
pkgver=1.1.0
pkgrel=2
pkgdesc="A SBB/CFF/FFS (Swiss railway) commandline based timetable client"
url="https://github.com/dbrgn/fahrplan"
depends=(
    'python'
    'python-six'
    'python-dateutil'
    'python-requests'
    'python-texttable>0.8.6'
)

makedepends=('python3')
license=('GPLv3')
arch=('any')
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
  '4b6e1844579e458d29a7b436b92360e3e9c45708921117f90aab9e5533974c0b'
  'SKIP'
)
validpgpkeys=('EA456E8BAF0109429583EED83578F667F2F3A5FA')

if [ -n "$VIRTUAL_ENV" ]; then
  echo "Warning: You're building within a virtualenv. Use"
  echo "a shell without virtualenv to build this package!"
  exit 1
fi


build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    sed -i -e 's/texttable.*/texttable>=0.9/' requirements.txt
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
