# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=20.12.2
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://community.kde.org/KDEConnect'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kde-network)
depends=(kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2 hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'qt5-tools: for some runcommand plugin actions')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz"{,.sig})
sha256sums=('21ca118b9ca7c6107c2cbedc95778f6f0ea03411f3b8d9f815660511ec0a9d71'
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
