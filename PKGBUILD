pkgname=file-commander-git
pkgver=0.9.3.2.r33.g7efe4eb
pkgrel=2
pkgdesc='A simple fullscreen word processorQt-based cross-platform Total Commander-like orthodox file manager for Windows, Mac and Linux'
arch=('i686' 'x86_64')
url="https://github.com/VioletGiraffe/file-commander"
license=('GPL3')
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
  qmake PREFIX=/opt/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/opt/$pkgname
  cp $srcdir/$pkgname/bin/release/* $pkgdir/opt/$pkgname
  mkdir -p $pkgdir/usr/bin/
  install -Dm755 $pkgdir/opt/$pkgname/FileCommander $pkgdir/usr/bin

}
