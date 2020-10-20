# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator-git
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=r234.5d34628
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
arch=('any')
provides=('jupyterhub-nativeauthenticator')
conflicts=('jupyterhub-nativeauthenticator')
depends=('jupyterhub' 'python-bcrypt' 'python-onetimepass')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'jupyter')
license=('BSD')
source=(
  'git+https://github.com/jupyterhub/nativeauthenticator.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd nativeauthenticator
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd nativeauthenticator
    python setup.py build
}

check() {
    cd nativeauthenticator
    pytest
}

package() {
    cd nativeauthenticator
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
