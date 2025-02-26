# Maintainer: Richard PALO <richard.palo@free.fr>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=python-schwifty
_name=${pkgname#python-}
pkgver=2025.1.0
pkgrel=1
pkgdesc="Validate/generate IBANS and BICS"
arch=('any')
url="http://github.com/mdomke/schwifty"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('python-pydantic>=2.0: data validation')
depends=('python>=3.9' 'python-iso3166' 'python-pycountry' 'python-rstr')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('f492f3cbea3beb1fe0bf11a89075e6e413a5f500ee1afdb29a124a9a89b1a2ca')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
