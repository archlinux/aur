# Maintainer: Luis Falcon <falcon at gnuhealth dot org>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mygnuhealth
_name=MyGNUHealth
pkgver=1.0.3
pkgrel=1
pkgdesc="The GNU Health Personal Health Record (PHR)"
arch=('any')
url="https://www.gnuhealth.org"
license=('GPL3')
depends=('python' 'python-matplotlib' 'python-requests' 'python-tinydb' 'python-bcrypt' 'pyside2' 'kirigami2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('137adcbd99217568e198e4a8d1029fac7534b4362b5225394566ebebfd1ee51c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
  # root installing the package via setup.py gives the wrong permissions to variants.db
  # we use this workaround until a definitive fix is found
  chmod 444 build/lib/mygnuhealth/data/variants.db
}

package() {
  cd "$_name-$pkgver"
  # install the actual package with the right permissions
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
