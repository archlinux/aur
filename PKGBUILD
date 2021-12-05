# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=1.0.5
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
arch=('any')
depends=('jupyterhub' 'python-bcrypt' 'python-onetimepass')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'jupyter')
license=('BSD')
source=(
  "https://files.pythonhosted.org/packages/source/j/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'a9271b49a22667d67cd82a7441569cbaefc2947ade507d3d52dda47629ab60a5'
)

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    pytest -v
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
