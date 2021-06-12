# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=landrop
_pkgname=LANDrop
pkgver=0.4.0
pkgrel=2
pkgdesc="Drop any files to any devices on your LAN"
arch=('x86_64')
url="https://landrop.app"
license=('BSD' 'custom:CC-BY-NC-ND-4.0')
depends=('qt5-base' 'libsodium' 'hicolor-icon-theme' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LANDrop/LANDrop/archive/v$pkgver.tar.gz")
b2sums=('8dc02cf952bc8761265d2ea78868f6ea81a4a0be7496c017b87b0253bd82e2d729b1172a6eeafdc73966d628c8f67bd60600daf6a43adf365b5afd986a249cf2')

prepare() {
	cd "$_pkgname-$pkgver"
  mkdir build

  # correct install path
  sed -i "s|usr/local|usr|" "$_pkgname/$_pkgname.pro"
}

build() {
	cd "$_pkgname-$pkgver/build"
  qmake "../$_pkgname"
  make
}

package() {
	cd "$_pkgname-$pkgver/build"
  make INSTALL_ROOT="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE ../LICENSE.icon
}
