# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-firstuseauthenticator
pkgdesc="Authenticator to help new users create a password on first JupyterHub login"
pkgver=1.0.0
pkgrel=2
url="https://github.com/jupyterhub/firstuseauthenticator"
license=('BSD-3-Clause')
arch=('any')

depends=('jupyterhub' 'python-bcrypt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')

source=(
  "git+${url}.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd firstuseauthenticator
  python -m build --no-isolation --wheel
}

check() {
  cd firstuseauthenticator
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/jupyterhub_firstuseauthenticator-$pkgver"*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd firstuseauthenticator
  python -m installer --destdir="$pkgdir" "dist/jupyterhub_firstuseauthenticator-$pkgver"*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
