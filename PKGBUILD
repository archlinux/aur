# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="redrock"
_templatesver="0.7.2"
pkgname=python-redrock
pkgver=0.13.2
pkgrel=2
pkgdesc="Redshifting fitting for spectroperfectionism"
arch=(any)
url="https://github.com/desihub/redrock"
license=('custom')
depends=('python-fitsio' 'python-setuptools' 'python-numba' 'python-healpy'
         'python-requests' 'python-desiutil' 'python-desispec')
optdepends=("python-empca: for templates")
backup=('etc/redrock.module')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"$_pkgname-templates-$_templatesver"::"https://github.com/desihub/${_pkgname}-templates/archive/refs/tags/${_templatesver}.tar.gz")
sha256sums=('e6eab5c22b156a08596daa85f5a7dd1d79ee283cef87f604caf704e46b54da84'
            '2befc641022121042e49e91d84e373a32e2252f2cf35f2e8f428b3bf97ad776b')

prepare()
{
  cd "$srcdir/${_pkgname}-$pkgver"
  mkdir -p "py/redrock/templates"
  cp -rf "$srcdir/${_pkgname}-templates-${_templatesver}"/* "py/redrock/templates" 
}

build()
{
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

