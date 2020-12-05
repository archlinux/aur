# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=0.0.6
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
  '65cc2dd5194d6b9bf7819d45ed5cacb1035b4d544dcbc6d4363f0bc4fee6630f'
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
