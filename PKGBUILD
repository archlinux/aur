# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=fahrplan
pkgver=1.1.0
pkgrel=1
pkgdesc="A SBB/CFF/FFS (Swiss railway) commandline based timetable client"
url="https://github.com/dbrgn/fahrplan"
depends=(
    'python'
    'python-six'
    'python-dateutil'
    'python-requests'
    'python-texttable>0.8.6'
)

# texttable<0.9,>=0.8.6

makedepends=('python3')
license=('GPLv3')
arch=('any')
source=("https://github.com/dbrgn/fahrplan/archive/v$pkgver.tar.gz")
sha256sums=('adb1a5d27ecbba538a64ba4c74ff084466e8d983643e49c8791ea22a6cd21c72')

if [ -n "$VIRTUAL_ENV" ]; then
  echo "Warning: You're building within a virtualenv. Use"
  echo "a shell without virtualenv to build this package!"
  exit 1
fi


build() {
    cd $srcdir/fahrplan-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/fahrplan-$pkgver
    sed -i -e 's/texttable.*/texttable>=0.9/' requirements.txt
    python setup.py install --root="$pkgdir" --optimize=1
}
