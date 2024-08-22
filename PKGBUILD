# Maintainer: Marek Küthe <m.k@mk16.de>

pkgname=ripe-atlas-tools
pkgver=3.1.0
pkgrel=1
pkgdesc="Official command-line client for RIPE Atlas"
arch=('x86_64')
url="https://github.com/RIPE-NCC/ripe-atlas-tools"
license=('GPL-3.0-or-later')
depends=('python-ripe-atlas-cousteau' 'python-ripe-atlas-sagan')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RIPE-NCC/ripe-atlas-tools/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(caa10e59cb40f631a234318b3e33edcdc1074a46c298648ccc3f299ed7ec8e4ecde089df1950372b97bf736aaf5cfabe340fc88f7f18045bb9c4f32fc3b3b69e)

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  # Remove shortcuts
  # see https://github.com/RIPE-NCC/ripe-atlas-tools/issues/245
  rm "$pkgdir/usr/bin/adig"
  rm "$pkgdir/usr/bin/ahttp"
  rm "$pkgdir/usr/bin/antp"
  rm "$pkgdir/usr/bin/aping"
  rm "$pkgdir/usr/bin/asslcert"
  rm "$pkgdir/usr/bin/atraceroute"
}

