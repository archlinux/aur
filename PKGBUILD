# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-$_pkgname"
pkgver=0.15.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('efd53ffc042252da3ee42d75b2e351cee396d0d3b9a31b366d7c9f93a451af9a')
b2sums=('fecfd482bae37cf22ed5cfa46125a809af8cf4719253617beb130c28eb508d053d0f7039269017848df759803d435baa436b2c1a91cf9e6b844c792fd29eb18a')

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
