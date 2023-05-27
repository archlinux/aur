# Maintainer: Jake <aur@ja-ke.tech>
### Based on extra/powerdevil:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=powerdevil-ddcutil
_pkgname=${pkgname%-ddcutil}
pkgver=5.27.5
pkgrel=3
pkgdesc='Power management for KDE plasma with DDC/CI enabled'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
conflicts=($_pkgname)
provides=($_pkgname)
depends=(plasma-workspace ddcutil)
makedepends=(extra-cmake-modules kdoctools bluez-qt networkmanager-qt)
optdepends=('kinfocenter: for the Energy Information KCM'
            'power-profiles-daemon: power profiles support'
            'networkmanager-qt: wireless power saving actions'
            'bluez-qt: wireless power saving actions')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('0379862c57efef4ce980f6c9583d66deafde1ed522f0e129aa50cef038fb500e'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DHAVE_DDCUTIL=On
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
