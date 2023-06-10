# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-systemdspawner
pkgdesc="Spawn JupyterHub single-user servers with systemd"
pkgver=1.0.1
pkgrel=1
url="https://github.com/jupyterhub/systemdspawner"
arch=('any')
license=('BSD')

depends=('jupyterhub' 'systemd')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '8d614f19d89564321fe55d80ecd134a0e2bf276274d45861495c9bb5a80add28'
)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
