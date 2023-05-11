# Maintainer: Maurizio D'Addona <mauritiusdadd@gmai.com>

_pkgname="desimodel"
pkgname=python-desimodel
pkgver=0.18.0
pkgrel=1
pkgdesc="Information about DESI hardware designs in machine readable formats"
arch=(any)
url="https://github.com/desihub/desispec"
license=('BSD')
depends=('python-setuptools' 'python-requests' 'python-astropy' 'python-healpy'
         'python-desiutil' 'python-scipy' 'python-pyyaml' 'python-numpy')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9f35e929af65060fdaae5a7a4895f2d237a7b6c142f9a7514c26ace00bf804e1')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver"
  sed -e "s/^setup_keywords\['use_2to3'\]/#setup_keywords['use_2to3']/g" -i "setup.py"
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
  python setup.py install --root="$pkgdir"
}

