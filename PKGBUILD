# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-qt5
pkgdesc='The multimedia framework by KDE'
pkgver=4.12.0
pkgrel=8
arch=(x86_64)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gcc-libs
         glibc
         libpulse
         qt5-base)
makedepends=(extra-cmake-modules
             qt5-tools)
optdepends=('pulseaudio: PulseAudio support'
            'qt5-tools: Designer plugin')
source=(https://download.kde.org/stable/phonon/$pkgver/phonon-$pkgver.tar.xz{,.sig})
sha256sums=('3287ffe0fbcc2d4aa1363f9e15747302d0b080090fe76e5f211d809ecb43f39a'
            'SKIP')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84  # Harald Sitter <sitter@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S phonon-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DPHONON_BUILD_QT6=OFF \
    -DPHONON_BUILD_SETTINGS=OFF
  cmake --build build
}

package(){
  optdepends+=('qt5-tools: Designer plugin')

  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share # Conflicts with phonon-qt6
}
