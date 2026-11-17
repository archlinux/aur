# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: robertfoster

_pkgname=gpsoauth
pkgname=python-$_pkgname
pkgver=3.0.1 # renovate: datasource=github-tags depName=simon-weber/gpsoauth
pkgrel=1
pkgdesc="A python client library for Google Play Services OAuth."
url="https://github.com/simon-weber/gpsoauth"
depends=('python' 'python-requests' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/simon-weber/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d7b1b9003701ebf212f480225acb9305e52ce130b90ea43f2b320459e04d3eb3')

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
