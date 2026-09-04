# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=objconv
pkgver=2.57
pkgrel=1
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL-3.0-or-later')
options+=('!debug')
depends=('glibc' 'libstdc++' 'libgcc')
source=("$pkgname-$pkgver.zip::http://www.agner.org/optimize/objconv.zip")
sha256sums=('0f604f93f97f689afd7615c86176eb15bc95001eadf8317f17ebd099c50c59e1')

prepare() {
  mkdir build
  bsdtar -xf source.zip -C build
}

build() {
  cd build
  g++ -v -o objconv -O2 *.cpp
}

package() {
  install -D -m755 build/objconv "$pkgdir"/usr/bin/objconv
  install -D -m755 objconv-instructions.pdf "$pkgdir"/usr/share/doc/$pkgname/manual.pdf
}
