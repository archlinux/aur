# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-idle-culler
pkgdesc="JupyterHub service to cull and shut down idle users and notebook servers"
pkgver=1.3.1
pkgrel=1
url="https://github.com/jupyterhub/jupyterhub-idle-culler"
license=('BSD-3-Clause')
arch=('any')

depends=('python-dateutil' 'python-packaging' 'python-tornado')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer' 'python-wheel')

_pyname=jupyterhub_idle_culler
source=(
  "git+https://github.com/jupyterhub/$pkgname.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "$pkgname"
  python -m build --no-isolation --wheel
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver-"*.whl

  install -Dm644 "COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
