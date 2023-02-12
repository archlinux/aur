# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-systemdspawner
pkgdesc="Spawn JupyterHub single-user servers with systemd"
pkgver=0.17.0
pkgrel=1
url="https://github.com/jupyterhub/systemdspawner"
arch=('any')
depends=('jupyterhub')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD')
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '5337a1266f3c0f6dbe162754061c1a8096ad7a9ccf519fe9f27219678051c21a'
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
