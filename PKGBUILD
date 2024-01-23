# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=3.0.1
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL3')
depends=(python python-packaging python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c53e07707cbd6c600dc759fbaacf787985396bd7dae971f6e969f45ac34d6edf0ed000e26d6cf71a52289edac07757b2c5341b82b33a780ccac36f6f57ae9f8c')

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
