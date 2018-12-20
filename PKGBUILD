# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com> 

_pkgname=discover
pkgname=discover-snap
provides=(discover)
conflicts=(discover)
pkgver=5.14.4
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI'
arch=(x86_64)
url='https://userbase.kde.org/Discover'
license=(LGPL)
depends=(knewstuff kitemmodels qt5-graphicaleffects appstream-qt archlinux-appstream-data
         hicolor-icon-theme kirigami2 snapd-glib snapd)
makedepends=(extra-cmake-modules plasma-framework packagekit-qt5 flatpak fwupd snapd-glib snapd)
optdepends=('packagekit-qt5: to manage packages from Arch Linux repositories' 'flatpak: Flatpak packages support'
            'fwupd: firmware update support')
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('d172ce8a5288e64920512a975985382e09c202b454633ffd88fedfe785f63b5e'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_SnapBackend=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
