# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-systemdspawner
pkgdesc="Spawn JupyterHub single-user servers with systemd"
pkgver=0.16
pkgrel=1
url="https://github.com/jupyterhub/systemdspawner"
arch=('any')
depends=('jupyterhub')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('BSD')
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'a7aeea1e8cb081a9c4de14475504199bbe249d93ea317da5c09d536b7b11b300'
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
