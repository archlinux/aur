# Maintainer: xsmile <>

pkgname=ryzen-ppd
pkgver=0.4
pkgrel=2
pkgdesc='Power management daemon for AMD Ryzen Mobile processors'
arch=(any)
url=https://github.com/xsmile/ryzen-ppd
license=(GPL3)
makedepends=(python-setuptools)
depends=(python-dbus-next python-gobject ryzenadj)
optdepends=('acpi_call: for setting ACPI platform profiles')
backup=(etc/ryzen-ppd.ini)
install=ryzen-ppd.install
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('1ca58d82b20f088bef34fa5e3e1dde1c57f631fad72a10c688bcce2d7b89a7fb')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 $pkgname.ini -t "$pkgdir"/etc/
  install -Dm644 scripts/systemd/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
