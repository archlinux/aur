# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='python-jh2'
_srcname='h2'
pkgver=5.0.8
pkgrel=1
pkgdesc='HTTP/2 State-Machine based protocol implementation'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/h2'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5467be3d50472ced50947707288926d23e9e0f4a563d2863bbda9f2e54e53b4b')

_srcdir="$_srcname-$pkgver"

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}
