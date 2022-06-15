# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux-git
_pkgname=activate-linux
pkgver=r148.8a4d6b4
pkgrel=2
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")

url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang' 'git' 'pkgconf' 'libxfixes' 'libxinerama')
depends=('cairo' 'libxi' 'libx11' 'libxt')
license=('custom')
conflict=('activate-linux')
sha512sums=('SKIP')

source=(git+https://github.com/MrGlockenspiel/activate-linux)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D activate-linux "$pkgdir/usr/bin/activate-linux"
}
