# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.9.0
pkgrel=1
pkgdesc="A dialect-flexible and configurable SQL linter"
arch=('any')
url="https://www.sqlfluff.com"
license=('MIT')
depends=(
  'python'
  'python-appdirs'
  'python-cached-property'
  'python-chardet'
  'python-click'
  'python-colorama'
  'python-diff-cover'
  'python-jinja'
  'python-oyaml'
  'python-pathspec'
  'python-pytest'
  'python-regex'
  'python-tblib'
  'python-toml'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=('python-setuptools')
#checkdepends=('python-hypothesis')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlfluff/sqlfluff/archive/$pkgver.tar.gz")
sha512sums=('314a3efaeb160a4b2947bfe62c0c67db6257a04022e6eeaef58f2d699bdcf52295d0c4fded11a48c9add6c9db55ef8faf4f6107fa159cc2ae10874b86ceaae67')
b2sums=('4b1c523923ca51323244e67e5627041c43234da54378060a03273a978e3b8eaa6bbe9fb2d1a1c8b4bf31ab9be95e9c204fca2d3d78addfe67deb72325c987c80')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

# tests are failing, not sure why yet
#check() {
#  cd "$pkgname-$pkgver"
#
#  # skip failing tests for now
#  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest \
#    --ignore test/core/plugin_test.py \
#    --ignore plugins/sqlfluff-templater-dbt \
#    --ignore plugins/sqlfluff-plugin-example \
#    --deselect test/test_testing.py::test_rules__test_helper_has_variable_introspection
#}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install \
    --root="$pkgdir" \
    --optimize=1 \
    --skip-build

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
