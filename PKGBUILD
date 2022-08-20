# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=1.0.6
pkgrel=1
pkgdesc='Pytest plugin that allows multiple failures per test'
arch=('any')
url='https://github.com/okken/pytest-check'
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('a468a7f2675ca82ed18c354653e04f1bbe3ebaacffc0a9e872ae00e9655f99d401efb6e748c8f96876fda792920d35bf856f42e15381290c6557ed513b815279')
b2sums=('7c64fcaefd44ccd5e50f427c9ae92761a41bb1f068ee688c02ea88548e54fde4c37f3d377cd2a0bebcab78d22c4997c657e8fef697458e19d2ce51187609b54d')

prepare() {
  cd "$_pkgname-$pkgver"

  # remove flit-core version constraint
  sed \
    -i pyproject.toml \
    -e 's/,<3//'
}

build() {
  cd "$_pkgname-$pkgver"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
