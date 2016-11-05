# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sdees-git
pkgver=2.0.0.r2.gb68c4fe
pkgrel=1
pkgdesc="Sync down, decrypt, edit, encrypt, sync up"
arch=('i686' 'x86_64')
url="https://github.com/schollz/sdees"
license=('MIT')
provides=('sdees')
conflicts=('sdees')
depends=('git')
makedepends=('go')
source=(git+https://github.com/schollz/sdees.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/sdees
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"
  export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin"
  go get github.com/schollz/sdees
}

build() {
  export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin"
  cd "${srcdir}"/sdees

  make 
}

package () {
  cd "${srcdir}"/sdees

  install -Dm755 sdees "${pkgdir}"/usr/bin/sdees

#license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
