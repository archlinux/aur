# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desispec"
pkgname=python-desispec
pkgver=0.27.1
pkgrel=2
pkgdesc="Scripts and packages for building and running DESI spectroscopic analyses"
arch=(any)
url="https://github.com/desihub/desispec"
license=('custom')
depends=('python-requests' 'python-astropy' 'python-numba' 'python-healpy'
         'python-speclite' 'python-sqlalchemy' 'python-fitsio'
         'python-desiutil' 'python-desimodel')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"$pkgname-$pkgver.patch")
sha256sums=('673bc59f521074a6a237e72a2ed25972f8bd0dda341e9c81081f659a17646420'
            '7c55008a7964ceaf8ba736999e4d15ba2837e3a05c8ace5a868dfe069d65421f')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver"
  patch --forward --strip=2 --input="${srcdir}/$pkgname-$pkgver.patch"
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

