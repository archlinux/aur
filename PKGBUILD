# Maintainer: Richard PALO <richard.palo@free.fr>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=python-schwifty
_name=${pkgname#python-}
pkgver=2026.3.0
pkgrel=1
pkgdesc="Validate/generate IBANS and BICS"
arch=('any')
url="http://github.com/mdomke/schwifty"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('python-pydantic>=2.0: data validation')
depends=('python>3.9' 'python-pycountry' 'python-rstr')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
b2sums=('5c668c25fe464e4bce651c3dc134172421601772d535198a4cab26219fe245d23e1ca43c9598820fd63ab433fb554fc98e2ef18503e8fddc929243d0382f6009')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
