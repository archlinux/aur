# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>
# Contributor: Xiretza <xiretza at xiretza dot xyz>

pkgname=python-textx
_srcname=textX
pkgver=4.1.0
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
sha256sums=('3d4c691880d0c03553ce4a69db40668d099c7272c08e933472a3503b08bd1632')

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
