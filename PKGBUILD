# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nes-git
pkgver=r103.9d56bd1
pkgrel=1
pkgdesc="NES emulator written in Go."
arch=('any')
url="https://github.com/fogleman/nes"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=($pkgname::git+https://github.com/fogleman/nes.git)
md5sums=('SKIP')
_gourl=github.com/fogleman/nes
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH=$srcdir
  go get $_gourl
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}
