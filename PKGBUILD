# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Felix Yan 
# Contributor: Antonio Rojas 
# Contributor: Andrea Scarpino

pkgname=plasma-mobile-nm
_pkgname=plasma-nm
pkgver=5.24.3
pkgrel=0
pkgdesc='Plasma applet written in QML for managing network connections, built with modules for mobile'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL2)
depends=(plasma-workspace modemmanager-qt networkmanager-qt qca-qt5)
makedepends=(extra-cmake-modules openconnect)
optdepends=('openconnect: Cisco AnyConnect VPN plugin')
provides=("plasma-nm=$pkgver")
conflicts=("plasma-nm")
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz)
sha256sums=('2cf64e94ed921546bc0be44f50e3490033a353bf3f0ad7a5a513ef5585fc3bfd')
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
