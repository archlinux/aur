# Maintainer: Frederik Schwan <freswa at archlinux dot org>

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
b2sums=('SKIP'
        'bb6a60e8a57b6e9645bfdc9e26e960afbb4f1fea1228f8ce0040ce49cac788e2b04e99c71a3b7a219a14d8c3fb7da1e132f91d8772d7657b314eda0c9d039f2d')

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
