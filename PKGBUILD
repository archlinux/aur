# Maintainer: xsmile <>

pkgname=ryzen-ppd
pkgver=0.3
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
sha256sums=('6119af8828ecbfed23d77efc3bc78b9844908f8211bef4980a84f99aec795f20')

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
