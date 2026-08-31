# Maintainer: Leandro V. Catarin <leavitals@gmail.com>

pkgname=networkmanager-snx-plasma
pkgver=0.1.0
pkgrel=1
pkgdesc='NetworkManager VPN plugin for Check Point SNX/Remote Access (KDE Plasma Qt editor, no GTK dependency)'
arch=('x86_64')
url='https://github.com/lvitals/networkmanager-snx'
license=('MIT')
depends=('glib2' 'networkmanager' 'qt6-base' 'kcoreaddons' 'kwidgetsaddons' 'networkmanager-qt' 'plasma-nm' 'networkmanager-snx')
makedepends=('cmake' 'pkgconf')
source=("networkmanager-snx-$pkgver.tar.gz::https://github.com/lvitals/networkmanager-snx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d883f8237cd5d8947a6d8c55705290dc136fa02d77f4d05dfd019724e6717e4')

build() {
  cmake -S "networkmanager-snx-$pkgver/plasma" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "networkmanager-snx-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
