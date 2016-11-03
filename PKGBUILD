# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="tagsistant-git"
_pkgname="tagsistant"
pkgver=r71.0215b79
pkgrel=1
pkgdesc="Semantic File System for Linux kernels"
url="https://github.com/StrumentiResistenti/Tagsistant"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('subversion' 'git')
depends=('fuse' 'libdbi' 'libdbi-drivers' 'sqlite2' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'glib2' 'libextractor')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'tagsistant-svn')
install="tagsistant.install"
changelog="ChangeLog"
source=("${_pkgname}::git+https://github.com/StrumentiResistenti/Tagsistant")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/"

  autoreconf -vfi
  ./configure --prefix=/usr --datarootdir="${pkgdir}/usr/share/"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=4 sw=4 et:
