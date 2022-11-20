# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=LibCST
pkgname=python38-libcst
pkgver=0.3.20
pkgrel=4
pkgdesc="A concrete syntax tree parser and serializer library for Python that preserves many aspects of Python's abstract syntax tree"
arch=('any')
url='https://github.com/Instagram/LibCST'
license=('MIT')
depends=('python38-typing_extensions' 'python38-typing_inspect' 'python38-yaml')
makedepends=('python38-setuptools' 'python38-isort' 'python38-black')
checkdepends=('python38-hypothesis' 'python38-hypothesmith')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('03920d896850a228c3e48d9eb6256d6e781829965a6ccc4a8d9051ea8ad21a86c25b95cb4aef03b0fd3bd8d45694398dd7e30aeefc9d1b530747ee85ba73861f')

prepare() {
  cd $_pkgname-$pkgver

  sed -i 's/import AbstractBaseMatcherNodeMeta/import Optional, AbstractBaseMatcherNodeMeta/' libcst/codegen/gen_matcher_classes.py
  python3.8 -m libcst.codegen.generate matchers
}

build() {
  cd $_pkgname-$pkgver

  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python3.8 -m unittest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
