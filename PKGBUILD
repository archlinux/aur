#Maintainer: Mathias Roux <poussinberlin@gmail.com>
#Based on the official kdeconnect PKGBUILD
_name=kdeconnect
pkgname=$_name-bluetooth
pkgver=1.4
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone, with a bluetooth backend'
url='https://community.kde.org/KDEConnect'
license=(GPL)
arch=(x86_64)
depends=(hicolor-icon-theme kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2 qt5-connectivity)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'bluez: Basic bluetooth support')
provides=('kdeconnect')
source=("https://download.kde.org/stable/$_name/$pkgver/$_name-kde-$pkgver.tar.xz"{,.sig})
sha256sums=('caee7945a9d9bb881a943dc8d2fd0d702c04da5bdb2df14d4f875e7cf5d5261a'
            'SKIP')
validpgpkeys=(B3487CA0FF36258E2A2F338BD33E721DF877EFE8  # Albert Vaca Cintora <albertvaka@gmail.com>
              F53223F3337665C2CCEA122E873AC3459BBCF5C0) # Nicolas Fella <nicolas.fella@kdab.com>


prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_name-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib\
    -DBLUETOOTH_ENABLED=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
