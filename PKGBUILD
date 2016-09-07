# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sdees-git
pkgver=1.2.0.r1.g2a98a60
pkgrel=1
pkgdesc="Sync down, decrypt, edit, encrypt, sync up"
arch=('i686' 'x86_64')
url="https://github.com/schollz/sdees"
license=('MIT')
provides=('sdees')
conflicts=('sdees')
makedepends=('git' 'go')
source=(git+https://github.com/schollz/sdees.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/sdees
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin"
  cd "${srcdir}"/sdees

  make 
}

package () {
  cd "${srcdir}"/sdees

  install -Dm755 sdees "${pkgdir}"/usr/bin/sdees

# license file not available
#   install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING 
}
