# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: prettyvanilla <prettyvanilla at posteo dot at>
# Contributor: Dany Martineau <dany.luc.martineau at gmail dot com>

pkgname=klook-git
_pkgname="klook"
pkgver=v2.0_10_5_gf01e033
pkgrel=1
pkgdesc="A quick file content preview application that supports integration with Dolphin"
arch=('i686' 'x86_64')
url="https://github.com/KDE/klook.git"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake' 'git')
install="${pkgname}.install"
source=("git+https://github.com/KDE/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo $(git describe --tags | sed 's/-/_/g')
}

build() {
  cd "${_pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
