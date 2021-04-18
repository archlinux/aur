# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=termbox2-git
pkgver=1.1.0.r140.g208429c
pkgrel=1
pkgdesc="Termbox fork that aims to handle input and keybindings correctly"
arch=('x86_64')
url="https://github.com/tomas/termbox"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake>=2.8')
provides=("${pkgname%-git}" 'libtermbox.so')
conflicts=("${pkgname%-git}" 'termbox')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake -S "$pkgname" -B build -DBUILD_DEMOS=0 -DTRUE_COLOR=1 -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  DESTDIR="$pkgdir/" make install -C build
  cd "$pkgname"
  install -Dvm 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
