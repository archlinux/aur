# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-systemdspawner
pkgdesc="Spawn JupyterHub single-user servers with systemd"
pkgver=1.0.2
pkgrel=1
url="https://github.com/jupyterhub/systemdspawner"
arch=('any')
license=('BSD-3-Clause')

depends=(
  'jupyterhub'
  'systemd'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pypi=${pkgname/-/_}
source=(
  "git+https://github.com/jupyterhub/systemdspawner.git#tag=v$pkgver"
)
sha256sums=(
  'b05603be51faf7aaf52d823e42c70de8fbcda2a8d2332b48792604d0da11f256'
)

build() {
  cd systemdspawner
  python -m build --wheel --no-isolation
}

package() {
  cd systemdspawner
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
