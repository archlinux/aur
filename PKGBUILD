# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=layer-shell-qt5
_pkgname=layer-shell-qt
pkgver=5.27.11
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Qt 5 component to allow applications to make use of the Wayland wl-layer-shell protocol'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL LGPL)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig})
depends=(qt5-wayland)
makedepends=(extra-cmake-modules wayland-protocols)
sha256sums=('f4c321091619c9aeffe9e3568ff22ba4434538dcb3e89e6e23f5950d1e76d350'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DKDE_INSTALL_INCLUDEDIR=include/plasma5/ \
    -DKDE_INSTALL_CMAKEPACKAGEDIR=lib/cmake/plasma5/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/lib/*.so
}
