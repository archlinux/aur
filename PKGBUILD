# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=23.04.1
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kde-network)
depends=(kcmutils libfakekey qca-qt5 kpeoplevcard pulseaudio-qt qqc2-desktop-style kirigami-addons modemmanager-qt)
makedepends=(extra-cmake-modules kdoctools wayland-protocols)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'qt5-tools: for some runcommand plugin actions')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz{,.sig})
sha256sums=('070b34e0bea84c65fe8cef75ddf989ea136d8bba5f3eccf061c19383977d09c4'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
