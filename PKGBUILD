# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-sudospawner
pkgdesc="Spawn JupyterHub single-user servers with sudo"
pkgver=0.5.2
pkgrel=3
url="https://github.com/jupyterhub/sudospawner"
license=('BSD-3-Clause')
arch=('any')

depends=('jupyterhub' 'jupyter-notebook')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(
  "sudospawner-$pkgver.tar.gz::https://github.com/jupyterhub/sudospawner/archive/$pkgver.tar.gz"
)
sha256sums=(
  'bee2f1fff8795918408a9cf9eef5988b5eff48c2dac38d37adba2cbdd8a578a5'
)

build() {
  cd "sudospawner-${pkgver}"
  python -m build --no-isolation --wheel
}

package() {
  cd "sudospawner-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/sudospawner-$pkgver"*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 CHANGELOG.md README.md
  install -t "${pkgdir}/usr/share/doc/${pkgname}/examples" -vDm 644 examples/*
}
