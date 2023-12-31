# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-$_pkgname"
pkgver=0.16.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('9eb4a2c74f28722bf4bdcd5c0fdf35afaa1042b58f638204d0291873c8db7131')
b2sums=('bf0dd78ab3a09b7476c2767932e55be494f54e4eff4724dd79f0b3be2c406a9e356b77f31e93b45bda458f63e8953da063202d505f702d6fff7c737e2a933757')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname//-/_}-${pkgver}"

  PYTHONPATH="src" pytest
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
