# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=oauth2token
pkgname=python-${_base}
_commit=ef0e3fe3eef64f400cfba222fb172364c856da77
pkgver=0.0.3.r3.gef0e3f
_pkgver="${pkgver%.r*}"
pkgrel=3
pkgdesc="Simple cli tools to create and use oauth2token"
arch=('any')
url="https://github.com/vannten/${_base}"
license=('GPL')
depends=('python' 'python-pyxdg' 'python-google-auth-oauthlib')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('afa8dff8e431b8be150b888d441240ccb1ca5ce91bacc6f1f2e211dab90e565a9ae6b2f4646f8f03ad0a487273585e17d26adf2a4bbd44832764f7e48dd231d3')

build() {
  cd "${_base}-${_commit}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
