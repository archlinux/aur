# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=just-git
pkgver=0.3.1.326
pkgrel=1
pkgdesc="Just a command runner, like make."
arch=('x86_64' 'i686')
url="https://github.com/casey/just"
license=('WTFPL' 'MIT' 'Apache-2.0')
makedepends=('cargo')
provides=('just')
conflicts=('just')
source=(git+https://github.com/casey/just.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git describe|tr -d v).$(git rev-list --count HEAD)
}

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -D -m755 "$srcdir/$pkgname/target/release/just" "$pkgdir/usr/bin/just"
}
