# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: robertfoster

_pkgname=gpsoauth
pkgname=python-$_pkgname
pkgver=2.0.0 # renovate: datasource=github-tags depName=simon-weber/gpsoauth
pkgrel=1
pkgdesc="A python client library for Google Play Services OAuth."
url="https://github.com/simon-weber/gpsoauth"
depends=('python' 'python-requests' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/simon-weber/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5a485241ff151846e92f7cc73780916d87f3ade8ba0d6ed024800c89445145c6')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"

  # importlib.metadata.PackageNotFoundError: No package metadata was found for gpsoauth
  #pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
