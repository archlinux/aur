# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Felix Yan 
# Contributor: Antonio Rojas 
# Contributor: Andrea Scarpino

pkgname=plasma-mobile-nm
_pkgname=plasma-nm
pkgver=5.27.4
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
sha256sums=('2ee6bff818e5168062e1e4358851697e4397d8b666e4a58a4883489c1a51214b')
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
