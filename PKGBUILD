# Maintainer: nardholio <nardholio at gmail dot com>
# Contributor: Max Luebke <maxluebke(at)gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: yochananmarqos

pkgname=notepadnext
pkgver=0.15
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL-3.0-only')
depends=('libgcc' 'libstdc++' 'glibc' 'libxcb' 'qt6-5compat' 'hicolor-icon-theme' 'qt6-base')
makedepends=('git' 'cmake' 'qt6-tools')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('59dc5461ca49cf110707649f75568c45834b1cfd094ffb7ac14cab8c2a923a42')

build() {
  cd "$srcdir/$pkgname"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON

  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="${pkgdir}" cmake --install build
}
