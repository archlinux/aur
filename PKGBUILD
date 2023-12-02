# Maintainer: David Vogt <dave at winged dot ch>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key: https://keybase.io/dbrgn

pkgname=fahrplan
pkgver=1.1.2
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
)
sha256sums=(
  'da0835ae6ee1aefe64f92b82f8a9df7f313e41ec5e429985961a7a9294e24b6c'
)

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
