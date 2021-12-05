# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-firstuseauthenticator
pkgdesc="Authenticator to help new users create a password on first JupyterHub login"
pkgver=1.0.0
pkgrel=1
url="https://github.com/jupyterhub/firstuseauthenticator"
arch=('any')
depends=('jupyterhub' 'python-bcrypt')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
license=('BSD')
_reponame=firstuseauthenticator
source=(
  "git+https://github.com/jupyterhub/$_reponame.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
    cd "$_reponame"
    python setup.py build
}

check() {
    cd "$_reponame"
    PYTHONPATH="$PWD/build/lib" python -m pytest -v
}

package() {
    cd "$_reponame"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
