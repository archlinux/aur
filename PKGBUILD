# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=21.12.3
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kde-network)
depends=(kcmutils kwayland libfakekey qca-qt5 kpeoplevcard pulseaudio-qt qqc2-desktop-style hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'qt5-tools: for some runcommand plugin actions')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz{,.sig}
        kdeconnect-openssh-8.8.patch)
sha256sums=('8fc84f22ad5fa1371a109679f283baaf8728c05a92b9a6f36629b8f8d9a933d9'
            'SKIP'
            'e1b43f8b3e0b2a521277d70d4fdeb8dff714f6855f33ae1c3c7d8f03fe69dbb9')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

prepare() {
  patch -d $pkgname-kde-$pkgver -p1 < kdeconnect-openssh-8.8.patch # Fix file browsing with openssh 8.8
}

build() {
  cmake -B build -S $pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
