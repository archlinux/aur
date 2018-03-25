pkgname=file-commander-git
_pkgname=file-commander
pkgver=0.9.4.r4.g3e04fc4
pkgrel=1
pkgdesc='Qt-based cross-platform Total Commander-like orthodox file manager for Windows, Mac and Linux'
arch=('i686' 'x86_64')
url="https://github.com/VioletGiraffe/file-commander"
license=('GPL3')
options=()
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
makedepends=('qt5-tools')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  qmake PREFIX=/opt/$_pkgname
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/opt/$_pkgname
  cp -r $srcdir/$pkgname/bin/release/x64/* $pkgdir/opt/$_pkgname
  mkdir -p $pkgdir/usr/bin/
  install -Dm755 $pkgdir/opt/$_pkgname/FileCommander $pkgdir/usr/bin

}
