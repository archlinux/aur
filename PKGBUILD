# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
epoch=1
pkgver=1.2.0
pkgrel=1
pkgdesc='Python interface for the MET Norway Locationforecast/2.0 weather service'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/Rory-Sullivan/metno-locationforecast'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  'setup-py.diff'
)
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
changelog="$pkgname.changelog"

prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np1 -i "$srcdir/setup-py.diff"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README}.md
}

sha256sums=(
  '1b5cc928fe8cededdd2eb86443e73130591f9414b6d3e0e81712053facf395f1'
  'd8c2128c2deb3dc5ac2b0d27817269f2b830466b3b6553b96bea2d1c7c4fd14a'
)
b2sums=(
  'de9e2182692db57101dee8217b539db4cd0fab97e86b54c9bed3f285bf2128e1279dd36dbf60eaf5f1e08111c8d097c80865a288bf3ffe156c1e5bb5cd3d300c'
  '09f0f08eb3bfb6a1be64e65cb4ec1d1d8714ef3c73faa181b5652090aee7ab33ce166a41a14b959bf0a2fc69cc11e75b35fcf3295ea3c6486f5de66e64145d75'
)

# eof
