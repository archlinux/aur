# Maintainer: xsmile <>

pkgname=ryzen-ppd
pkgver=0.4.1
pkgrel=3
pkgdesc='Power management daemon for AMD Ryzen Mobile processors'
arch=(any)
url=https://github.com/xsmile/ryzen-ppd
license=(GPL3)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-dbus-next python-gobject ryzenadj upower)
optdepends=('acpi_call: for setting ACPI platform profiles')
backup=(etc/ryzen-ppd.ini)
install=ryzen-ppd.install
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('b30fc89e9513209edcff6c1e0805ea0e22965b13da7f933b6308382fb977c347')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 $pkgname.ini -t "$pkgdir"/etc/
  install -Dm644 scripts/systemd/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  python -m installer --destdir="$pkgdir" dist/*.whl
}
