# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=21.08.3
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
sha256sums=('324663336db1000163eae91a63be84b6a614131ed62bd6dd6563639ecd5bdabd'
            'SKIP'
            'e5cb803e7b21f31fd40639fa74e6f6aaaa7e136053a79f3b88f2bbb36bb58a4f')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

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
