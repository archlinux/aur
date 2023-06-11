# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-translate
pkgdesc="JupyterLab language pack translations helper"
url='https://github.com/jupyterlab/jupyterlab-translate'
pkgver=1.3.2
pkgrel=1
arch=('any')
license=('BSD')

depends=(
  'python-babel' 'python-click' 'python-copier' 'python-polib'
  'python-questionary' 'python-dunamai'
)
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '75dca8f73552b86fb8d33268722630429c8f85a247a93f2ff3097d92a8990eaf'
)

build() {
  cd "${pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
