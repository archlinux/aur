# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=python-geoipsets
pkgver=2.3.4
pkgrel=1
pkgdesc='Tool to generate country-specific IP ranges for iptables/ipset and nftables'
arch=('any')
license=('GPL3')
url='https://github.com/chr0mag/geoipsets/tree/main/python'
depends=(
  'python-requests'
  'python-beautifulsoup4'
)
makedepends=(
  'python-setuptools'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chr0mag/geoipsets/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b92d45cc3db3aaf465c64b126774df9656836513d9d3ad03fb979ab15b62b6f8b7270a665f39fafb129f42f2a1c95a77b85e0689b7a62e32b31a9a48082adfb2')

build() {
  cd "geoipsets-$pkgver/python"

  python setup.py build
}

check() {
  cd "geoipsets-$pkgver/python"

  python -m pytest
}

package() {
  cd "geoipsets-$pkgver/python"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README_python.md"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ../systemd/update-geoipsets.service "${pkgdir}/usr/lib/systemd/system/update-geoipsets.service"
  install -Dm644 ../systemd/update-geoipsets.timer "${pkgdir}/usr/lib/systemd/system/update-geoipsets.timer"
}
