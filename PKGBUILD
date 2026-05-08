# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=5.0.4
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL-3.0-only')
depends=(python python-packaging python-requests python-pymysql)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('903177ea0fb7b11c0b308538aef8765abb8fe24352633e9d83e8743c7dad7ec4a656ac9c95f278ed33cc0ec8071aeefb00ca1d46a936fc6666a63a6a84c56ef1')

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
