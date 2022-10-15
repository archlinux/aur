# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Felix Yan 
# Contributor: Antonio Rojas 
# Contributor: Andrea Scarpino

pkgname=plasma-mobile-nm
_pkgname=plasma-nm
pkgver=5.26.0
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
sha256sums=('7e9adf6bbbd565227871f80716b46d86deddad32628b150185d38a1d70245eae')
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
