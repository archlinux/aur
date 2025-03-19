# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
_pkgname=cgdb
pkgname="${_pkgname}-git"
pkgver=v0.8.0.r62.g6bbf5c4
pkgrel=2
pkgdesc="Curses-based interface to the GNU Debugger"
arch=('x86_64')
url="http://cgdb.github.io/"
license=('GPL')
depends=('readline>=5.1' 'ncurses' 'gdb')
conflicts=('cgdb')
makedepends=('git' 'help2man')
source=("git+https://github.com/cgdb/cgdb")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i 's/^main()$/int &/' config/readline_check_version.m4
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}
