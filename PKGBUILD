# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-perscache
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="An easy to use decorator for persistent memoization"
arch=(any)
url="https://github.com/leshchenko1979/perscache"
license=(MIT)
depends=(
  python
  python-beartype
  python-cloudpickle
  python-gcsfs
  python-icontract
  python-pandas
  python-pyarrow
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-pbr
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest-asyncio
  python-pytest
)

_commit=d4da6b4cb398576417843374c69474402906faa1 # git rev-parse "$pkgver"
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_archive="$_name"

pkgver() {
  cd "$_archive"

  git describe --tags
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
