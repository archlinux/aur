# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-atoml
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=3
pkgdesc="Yet another style-preserving TOML library for Python."
arch=("any")
url="https://github.com/frostming/atoml.git"
license=("MIT")
makedepends=(python-installer python-build python-wheel python-pdm-pep517)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('2739ae8facfc0ae7512d287e8597967caf815ae48be692c5c1814bee288e51acc7570dcb119f732fa15f6d240590b64b73b85a1b0144048eedfab8d62c840291')

build() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/${_name//-/_}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
