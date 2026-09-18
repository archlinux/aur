# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=5.0.6
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL-3.0-only')
depends=(python python-packaging python-requests python-pymysql)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('faaedef25a8973f4be9800e34da5d3fd9350ed4104cdbe84ec8084a67f692c369a82228d60e7006ef2a8ecfd2f063f9b2a120943a1ff7ee10d9952e07f9920a8')

build() {
  cd "$pkgname-$pkgver"
  # Replace setuptools version with greater than or equal to.
  sed -i "s/setuptools ~=/setuptools >=/" requirements.txt
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
