# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="mpp-solar"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Python package with reference library to get information from solar inverters"
pkgver="0.9.01"
pkgrel=1
url="https://github.com/jblance/mpp-solar"
license=('MIT')
arch=('any')
makedepends=("python-pyserial"
             "python-paho-mqtt"
             "python-pyyaml"
             "python-pymongo"
             "python-psycopg2")
source=("https://github.com/jblance/mpp-solar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4efaf43817d5403f344dca115daf4012ee9018180ba1305cf5f511ff8829dee')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package_python-mpp-solar(){
  depends=('python-lunardate'
           'python-pycalverter'
           'python-pytz'
           'python-dateutil'
           'python-pyephem')

  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et
