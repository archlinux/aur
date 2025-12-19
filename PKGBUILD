# Maintainer: Richard PALO <richard.palo@free.fr>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=python-schwifty
_name=${pkgname#python-}
pkgver=2025.9.0
pkgrel=1
pkgdesc="Validate/generate IBANS and BICS"
arch=('any')
url="http://github.com/mdomke/schwifty"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('python-pydantic>=2.0: data validation')
depends=('python>=3.9' 'python-iso3166' 'python-pycountry' 'python-rstr')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
b2sums=('36299baa9b6422038a2fe8b2d9db0a92686e7ddcba331b299c5993384936560382044a59f476c20d50d52d95c8588cc30f1a9edeb6cb8552bf456a2e4b8ffb08')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
