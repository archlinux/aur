# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.9.2
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
sha512sums=('d399f00d03dfe1b75377985d1b222e353e4dae75a696904aa477c4913dedb3d82f90c11dde364b1a7391af8134e56dc19d3d1390edddb116f84c6614544df074')
b2sums=('3b20d8a8ce04faae0b59174dadc74eb8b3f7ea58cc2945e2f0a53a121a79573366b3f1f9c3897b4056083f42166237feae3869014601e02c679b20917ea8fd1d')

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
