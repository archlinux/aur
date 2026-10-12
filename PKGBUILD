# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=2.0.0 # renovate: datasource=pypi depName=Flask-Themes2
pkgrel=1
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
_realname=flask_themes2
source=("https://files.pythonhosted.org/packages/source/${_realname::1}/${_realname}/${_realname}-${pkgver}.tar.gz")

build() {
  cd "${_realname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_realname}-${pkgver}"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "${_realname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('86f8c2c6aaba7330f507ba6d2e2d04ea800b3a5ce52749efa2b3c0ea78459af5')
