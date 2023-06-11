# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=1.2.0
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
license=('BSD')
arch=('any')

depends=('jupyterhub' 'python-bcrypt' 'python-onetimepass')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'jupyter-notebook')

source=(
  "https://files.pythonhosted.org/packages/source/j/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '826228e6e9ca37736361e2e60c5723e245ec72e34fdc42cc218fc54a67f968e1'
)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
