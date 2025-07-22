# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-qt5-vlc
pkgdesc='Phonon VLC backend for Qt5'
pkgver=0.12.0
pkgrel=6
arch=(x86_64)
url='https://community.kde.org/Phonon'
license=(LGPL-2.1-or-later)
depends=(gcc-libs
         glibc
         libvlc
         phonon-qt5
         qt5-base
         vlc-plugins-base)
makedepends=(extra-cmake-modules
             qt5-tools)
provides=(phonon-qt5-backend)
source=(https://download.kde.org/stable/phonon/phonon-backend-vlc/$pkgver/phonon-backend-vlc-$pkgver.tar.xz{,.sig})
sha256sums=('338479dc451e4b94b3ca5b578def741dcf82f5c626a2807d36235be2dce7c9a5'
            'SKIP')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84  # Harald Sitter <sitter@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S phonon-backend-vlc-$pkgver \
    -DPHONON_BUILD_QT6=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share # Conflicts with Qt6
}
