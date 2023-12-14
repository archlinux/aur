# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL3')
depends=(python python-packaging python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('490b2ee0a66d8e5fbed7c4534cdfecb2279036a61b004b13556cb88052a4d718acbd957bedfd20328d85a40374567fa59388d1fc012874653ca853ea0527667d')

build() {
  cd "$pkgname-$pkgver"
  # Replace setuptools version with greater than or equal to.
  sed -i "s/setuptools~=/setuptools>=/" pyproject.toml
  sed -i "s/setuptools ~=/setuptools >=/" requirements.txt
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
