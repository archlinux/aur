# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-de-de
pkgdesc='German (Germany) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/tree/master/language-packs/jupyterlab-language-pack-de-DE'
pkgver=4.3.post0
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

makedepends=(
  'jupyterlab-translate'
  'python-build'
  'python-hatchling'
  'python-installer'
)

_pypi=jupyterlab_language_pack_de_de
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'ece2e64f18c7eb84df0be3b684e4c576630af6c580487343d1abb14902d8c127'
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
