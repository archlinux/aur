# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=seccomp-compile
pkgver=5.6eb7f9d
pkgrel=1
pkgdesc="Tiny utility to compile seccomp rules in gosecco format and spit them out on stdout"
url="https://github.com/mutantmonkey/seccomp-compile"
arch=('i686' 'x86_64')
license=('WTFPL')
makedepends=('git' 'go')
source=("git+https://github.com/mutantmonkey/seccomp-compile.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  GOPATH="$srcdir" go get -v -d
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 seccomp-compile "${pkgdir}/usr/bin/seccomp-compile"
}

# vim:set ts=2 sw=2 et:
