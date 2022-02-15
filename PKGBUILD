# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
pkgver=4.0.0
pkgrel=1
pkgdesc="Provides tag-expression parser for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/cucumber/tag-expressions/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b855386e00671c27c10febf1ce9a642d60cd07fc6afab5afe352733f3443c87067049e4a526b96ac5038f0ae334c730356c51fee826c22df920b2e8908ec25ba')

prepare() {
  cd tag-expressions-$pkgver/python
  sed -i '/use_2to3 = /d' setup.py
}

build() {
  cd tag-expressions-$pkgver/python
  python setup.py build
}

check() {
  cd tag-expressions-$pkgver/python
  python -m pytest
}

package() {
  cd tag-expressions-$pkgver/python
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
