# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: robertfoster

_pkgname=gpsoauth
pkgname=python-$_pkgname
pkgver='1.0.0'
pkgrel=1
pkgdesc="A python client library for Google Play Services OAuth."
url="https://github.com/simon-weber/gpsoauth"
depends=('python' 'python-requests' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-poetry')
license=('MIT')
arch=('any')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/simon-weber/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9f8bf74e17c4c42e2c636b6ffdeb20069ed4e468eccb3411c1d680bfdd498b8f')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
