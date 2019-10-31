# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=libpurple-lurch
pkgver=0.6.8
pkgrel=1
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/lurch'
license=('GPL')
makedepends=('cmake' 'git')
depends=('libpurple' 'mxml' 'libxml2' 'sqlite' 'libgcrypt')
optdepends=('libpurple-carbons: message carbons support')
conflicts=('libpurple-lurch-git')
source=("git+https://github.com/gkdr/lurch.git#tag=v${pkgver}"
        gitmodule-paths.patch)
sha512sums=('SKIP'
            '43bcadb8246b97bb54c3642cd249e675777ff5cb2e5b04b164b8541ae8a173ab4608b01bfa1f07534125abd8b14e8054a55e644697fa99451e16e248959487af')

prepare() {
  cd ${pkgname##libpurple-}
  patch -p0 < ${srcdir}/gitmodule-paths.patch
  git submodule update --init --recursive
}

build() {
  cd ${pkgname##libpurple-}
  make
}

package() {
  cd ${pkgname##libpurple-}
  make DESTDIR="${pkgdir}" install
}
