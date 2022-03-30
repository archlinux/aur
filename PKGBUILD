# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.0.5
pkgrel=1
pkgdesc="Pytest plugin that allows multiple failures per test"
arch=('any')
url="https://github.com/okken/pytest-check"
license=('MIT')
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-flit-core'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('4b3f25af1c7145b9089949d1edaccaf355c94fffc0fcf71e1d2dca7947b40d4a34e538525ba7fff5a498bf98029a65ed8c8c1c60256240d3047b54af2266a44b')
b2sums=('f4903c3d244cd9451e5ac89befc43cfb92854e07823c090d0a1eeeaad75ad0412255e7c3b0951d2f231d87a3be90a6e2a736bfb5061da223cc68e177109f99c9')

prepare() {
  cd "$_name-$pkgver"

  # remove flit-core version constraint
  sed \
    -i pyproject.toml \
    -e 's/,<3//'
}

build() {
  cd "$_name-$pkgver"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
