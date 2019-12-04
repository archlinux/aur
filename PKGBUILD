# Maintainer: Kevin Kuehler <keur@xcf.berkeley.edu>

_pkgname=brightnessctl
pkgname="$_pkgname-logind"
pkgver=0.4
pkgrel=4
pkgdesc="Lightweight brightness control tool (compiled to use logind)"
arch=('x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f0e1abe4dd7fc66a7990c0c42ecd9af079ba397fb0a49d339c5927fe639edbce4c30ecfcd16c3e0bf58de2eb4ca611dd1e1ce40eec9f95fe3960189c5e5396d8')
conflicts=('brightnessctl')
provides=('brightnessctl')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ENABLE_SYSTEMD=1 make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INSTALL_UDEV_RULES=0 DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
