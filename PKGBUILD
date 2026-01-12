# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/'
pkgver=4.5.post1
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

makedepends=(
  'jupyterlab-translate'
  'python-build'
  'python-hatchling'
  'python-installer'
)

_pypi=jupyterlab_language_pack_no_no
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'a4eca912f1f8a1dc3e2c93d636cf6adb46c9005b9a0899c5ccb424ea269fef26'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
