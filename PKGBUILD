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
source=("git+https://github.com/gkdr/lurch.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname##libpurple-}"
    sed -i "s#\.\./#https://github.com/gkdr/#g" .gitmodules
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${pkgname##libpurple-}"
    make
}

package() {
    cd "${srcdir}/${pkgname##libpurple-}"
    make DESTDIR="${pkgdir}" install
}
