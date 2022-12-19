# Maintainer: PaddiM8 <bakk@tuta.io>
pkgname=asahi-battery-threshold-git
_pkgname=asahi-battery-threshold
pkgver=v0.0.1.r1.gf084863
pkgrel=1
pkgdesc="A small daemon that allows setting a charging threshold for laptops running Asahi Linux."
arch=('aarch64')
url="https://github.com/PaddiM8/asahi-battery-threshold"
license=('MIT')
makedepends=('cargo')
source=('git+https://github.com/PaddiM8/asahi-battery-threshold')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  cd $_pkgname
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm664 "extra/$_pkgname.service" "$pkgdir/etc/systemd/system/$_pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('SKIP')
