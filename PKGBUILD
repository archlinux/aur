# Maintainer: Shang Yuanchun <idealities@gmail.com>

pkgbase=dhex
pkgname=dhex-git
pkgver=r4.dde4756
pkgrel=1
pkgdesc="An ncurses-based hexeditor with a diff mode"
arch=('x86_64')
url="https://github.com/ideal/dhex/"
license=('GPL')
depends=('ncurses')
conflictc=('dhex')
source=("git+https://github.com/ideal/dhex.git")
md5sums=('SKIP')

_pkgname=dhex

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}"/usr/{bin,share}
  install -d "${pkgdir}"/usr/man/man{1,5}
  make DESTDIR="${pkgdir}/usr" install
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"
}

