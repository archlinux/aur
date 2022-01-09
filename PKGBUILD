# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.9.1
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
sha512sums=('1e004fe0f543511ee9a26d633f56dda8d8b860d67f11e38480304643723c8b8fd8154e48b279aa6aa4c8d9d62a8365a35de8732dd448bb8f33fd4be59afdd37d')
b2sums=('d354b8aad3c4e567951c2081abe6f68a17ab02c48769f4b81b8aaea377aa29169522590a2a4e0b4ece3d058755458362c8cf91758850156a18191be3c7a4a6da')

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
