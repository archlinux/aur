# Maintainer:  sudokode <sudokode@gmail.com>
# Contributor: Marcin Kulik <m@kulik.com>

name=asciinema
pkgname=asciinema-git
pkgver=1.0.0.r8.g365b36c
pkgrel=1
pkgdesc="Record and share your terminal sessions, the right way"
arch=('any')
url="https://github.com/sickill/$name"
license=('MIT')
makedepends=('git' 'go' 'gcc-go')
conflicts=("$name")
source=("$pkgname::git+https://github.com/sickill/${name}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd $pkgname

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd $pkgname

  GOPATH="$srcdir" make build
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
