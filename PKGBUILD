# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=1.1.0
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
arch=('any')
depends=('jupyterhub' 'python-bcrypt' 'python-onetimepass')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'jupyter-notebook')
license=('BSD')
source=(
  "https://files.pythonhosted.org/packages/source/j/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '190e760da620acea25246eb215ff671da7aee8a1603f9cbf3c359a404f009088'
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
