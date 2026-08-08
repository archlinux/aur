pkgname=noice-git
_pkgname=noice
pkgver=r281.79da641
pkgrel=1
pkgdesc='Small terminal file browser written in C'
arch=('i686' 'x86_64' 'armv6h')
url='http://git.2f30.org/noice/'
license=('BSD')
depends=('ncurses')
makedepends=('git')
source=('git+https://github.com/chrisw310/noice'
        'config.h')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cp "$srcdir/config.h" config.h
  sed -i 's/printw(str)/printw("%s", str)/' noice.c
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
