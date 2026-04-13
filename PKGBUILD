# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/'
pkgver=4.5.post3
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
  '80a534051e9886d56b20d10a647f9448ccb2df5f5674381bb6241f20fc9ef45a'
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
