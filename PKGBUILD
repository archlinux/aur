# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=4.0.1
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL3')
depends=(python python-packaging python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('357f57207778a5b83f762d8bb4f32a3c5fce2bc63847ca7774f26ea4afc097610642e31f0fffbe665a5f2ff1f8d041f1b299bd9288e7d879feb5d3662c344185')

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
