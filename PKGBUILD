# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname='desitarget'
pkgname=python-desitarget
pkgver=2.7.0
pkgrel=1
pkgdesc="Scripts and packages for selecting DESI targets from photometric catalogs"
arch=(any)
url="https://github.com/desihub/desitarget"
license=('custom')
depends=('python-setuptools' 'python-requests' 'python-pytz' 'python-astropy'
         'python-healpy' 'python-numba' 'python-speclite' 'python-sqlalchemy'
         'python-fitsio' 'python-photutils' 'python-specter' 'python-desimodel')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a9812a7cdf04049a887aea949cb9fcfa3e97f8c4134db8f61c318c8eb885f1a')

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

