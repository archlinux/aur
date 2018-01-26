# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu-git
_pkgname=smenu
pkgver=0.9.11.r0.g5ea933c
pkgrel=1
pkgdesc="Terminal utility that allows you to use words coming from the standard input to create a nice selection window just
below the cursor. Once done, your selection will be sent to standard output."
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
makedepends=('git')
provides=('smenu')
conflicts=('smenu')
source=('git+https://github.com/p-gen/smenu')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
