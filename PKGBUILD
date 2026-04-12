# Maintainer: David Jetelina <sour.soap5197@jtl.email>
# namcap: ignore deps
pkgname=tofuref
pkgver=1.8.1
pkgrel=1
pkgdesc="TUI for the OpenTofu provider registry"
arch=('any')
url="https://github.com/djetelina/tofuref"
license=('MIT')
replaces=('tofuref-bin')
conflicts=('tofuref-bin')
depends=(
  'python'
  'python-textual'
  'python-httpx'
  'python-platformdirs'
  'python-yaucl'
  'python-packaging'
  'python-frontmatter'
  'python-anyio'
  'python-rich'
  'python-linkify-it-py'
  'python-click'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("tofuref-$pkgver.tar.gz::https://github.com/djetelina/tofuref/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd01f8ecd3d057250bf3c3f0a84019272ccadc7d518b438238be8e4f159d4862')

build() {
  cd "tofuref-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "tofuref-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
