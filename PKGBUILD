# Maintainer: Blutkoete <tobias dot borgert at gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com> 
# (discover in Extra) Maintainer: Antonio Rojas <arojas at archlinux dot org> 

_pkgname=discover
pkgname=discover-snap
pkgver=5.25.4
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
conflicts=(discover)
provides=(discover)
depends=(knewstuff kcmutils kidletime qt5-graphicaleffects appstream-qt archlinux-appstream-data
         hicolor-icon-theme kirigami2 discount kuserfeedback snapd snapd-glib)
makedepends=(extra-cmake-modules plasma-framework packagekit-qt5 flatpak fwupd)
optdepends=('packagekit-qt5: to manage packages from Arch Linux repositories (not recommended, use at your own risk)'
            'flatpak: Flatpak packages support'
            'fwupd: firmware update support')
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e6fdb23e58be839ca2192ebbdaebed2846e723e6036e216a709437c44e969a94'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_SnapBackend=ON \
    -DWITH_KCM=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


