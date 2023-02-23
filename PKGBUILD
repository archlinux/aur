# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Felix Yan 
# Contributor: Antonio Rojas 
# Contributor: Andrea Scarpino

pkgname=plasma-mobile-nm
_pkgname=plasma-nm
pkgver=5.27.1
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections, built with modules for mobile'
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url='https://kde.org/plasma-desktop/'
license=(GPL2)
depends=(plasma-workspace modemmanager-qt networkmanager-qt qca-qt5)
makedepends=(extra-cmake-modules openconnect)
optdepends=('openconnect: Cisco AnyConnect VPN plugin')
provides=("plasma-nm=$pkgver")
conflicts=("plasma-nm")
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz)
sha256sums=('27d170e3e315a4ef2ffc4828b11c3a41b68ab213a15f56097789b7c41d6ba8a5')
options=(debug)

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_MOBILE=True
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
