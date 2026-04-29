# Maintainer: nardholio <nardholio at gmail dot com>
# Contributor: Max Luebke <maxluebke(at)gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: yochananmarqos

pkgname=notepadnext
pkgver=0.14
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL-3.0-only')
depends=('libgcc' 'libstdc++' 'glibc' 'libxcb' 'qt6-5compat' 'hicolor-icon-theme' 'qt6-base')
makedepends=('git' 'cmake' 'qt6-tools')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('7ef52082b9c048716a304d2f8591154739fb5871b4c90f2327460d360bce1946')

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
