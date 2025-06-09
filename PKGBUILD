# Maintainer: Hadi Chokr <hadichokr@icloud.com>
pkgname=kontainer-git
pkgver=Beta.9.g2a1a4ae
pkgrel=1
pkgdesc="A KDE-style Qt GUI to manage Distrobox containers"
arch=('any')
url="https://invent.kde.org/silverhadch/k-box"
license=('GPL-2.0-or-later')
depends=('qt6-base' 'qt6-tools' 'qt6-declarative' 'distrobox')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('kontainer')
conflicts=('kontainer')
source=("https://invent.kde.org/silverhadch/k-box.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/k-box"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g' || \
    echo "1.0.r0.g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/k-box" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 build/Kontainer "$pkgdir/usr/bin/Kontainer"
  install -Dm644 "$srcdir/k-box/kontainer.desktop" \
    "$pkgdir/usr/share/applications/kontainer.desktop"
}

