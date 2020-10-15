# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=0.0.5
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
  'e71b5c3ed1e3af4e307c7a43dce2fb56d4db161ec4fc59764b422cb696606376'
)

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
