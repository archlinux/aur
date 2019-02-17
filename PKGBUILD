# Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=ascii-rain-git
pkgver=r4.72ad7b3
pkgrel=1
pkgdesc="Comfy rain for your console written in C with Ncurses."
arch=('x86_64')
url="https://github.com/nkleemann/ascii-rain"
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=('ascii-rain::git+https://github.com/nkleemann/ascii-rain.git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  gcc -lncurses -O0 -Wl,-z,relro,-z,now -o rain rain.c
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 rain "$pkgdir/usr/bin/rain"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
