# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=ch341prog-git
_gitname=ch341prog
pkgver=r24.ae7204d
pkgrel=1
pkgdesc="A simple command line tool (programmer) interfacing with ch341a"
arch=('i686' 'x86_64')
url="https://github.com/setarcos/ch341prog.git"
license=('GPL')
depends=('libusb>=1')
makedepends=('git')
source=("${_gitname}::git+https://github.com/setarcos/ch341prog.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install the program
  install -Dm755 ch341prog "${pkgdir}/usr/bin/ch341prog"
}

# vim:set ft=sh ts=2 sw=2 et:
