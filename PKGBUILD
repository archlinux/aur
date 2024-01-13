# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=c3
pkgver=0.1.0
pkgrel=1
_gitname=c3
pkgdesc="A TUI to-do list that uses and extends calcurse format to have tree-like dependencies."
url="https://github.com/nimaaskarian/${_gitname}"

provides=(c3)
makedepends=(ncurses)
arch=('x86_64')
license=('GPL3')
optdepends=('potato-c: pomodoro timer module')

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/archive/refs/tags/${pkgver}.zip"
)

md5sums=('0060a7e5ab0b54d1b978fe68745abada')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  # make install DESTDIR="$pkgdir" PREFIX="/usr"
  cargo build --release
  cp ./target/release/c3 /usr/$pkgdir
}
