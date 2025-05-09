# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>
# Contributor: Xiretza <xiretza at xiretza dot xyz>

pkgname=python-textx
_srcname=textX
pkgver=4.2.0
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="https://textx.github.io/textX/"
license=('MIT')
depends=('python' 'python-setuptools' 'python-arpeggio')
optdepends=('python-click: textX CLI support')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('9a4e22df45eab34d7c504b8359dced06338a46c2b6a50aad025ec53da49c68a7')

build() {
  cd $_srcname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_srcname-$pkgver

  # textx fails to import from tests because it expects importlib metadata to be available
  #pytest --ignore tests/perf
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
