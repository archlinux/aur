# Maintainer: Hadi Chokr <hadichokr@icloud.com>
pkgname=kontainer-git
pkgver=1.0.1.8.gf14650b
pkgrel=3
pkgdesc="A KDE-style Qt GUI to manage Distrobox containers"
arch=('any')
url="https://invent.kde.org/system/kontainer"
license=('GPL-2.0-or-later')
depends=('qt6-base' 'qt6-tools' 'qt6-declarative' 'distrobox')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('kontainer')
conflicts=('kontainer')
source=("git+https://invent.kde.org/system/kontainer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kontainer" || return 1
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g' || \
    echo "1.0.r0.g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/kontainer" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 build/kontainer "$pkgdir/usr/bin/kontainer"
  install -Dm644 "$srcdir/kontainer/org.kde.kontainer.desktop" \
    "$pkgdir/usr/share/applications/kontainer.desktop"
}
