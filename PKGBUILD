# Maintainer: Leandro V. Catarin <leavitals@gmail.com>

pkgname=networkmanager-snx
pkgver=0.1.0
pkgrel=1
pkgdesc='NetworkManager VPN plugin for Check Point SNX/Remote Access (core D-Bus service, no desktop editor)'
arch=('x86_64')
url='https://github.com/lvitals/networkmanager-snx'
license=('MIT')
depends=('glib2' 'networkmanager')
makedepends=('meson' 'ninja' 'pkgconf')
checkdepends=('valgrind')
source=("networkmanager-snx-$pkgver.tar.gz::https://github.com/lvitals/networkmanager-snx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d883f8237cd5d8947a6d8c55705290dc136fa02d77f4d05dfd019724e6717e4')

build() {
  arch-meson "networkmanager-snx-$pkgver/common" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "networkmanager-snx-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
