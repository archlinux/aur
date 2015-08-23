pkgname=noice-git
_pkgname=noice
pkgver=0.2.r15.gc528339
pkgrel=1
pkgdesc='Small file browser'
arch=('i686' 'x86_64' 'armv6h')
url='http://git.2f30.org/noice/'
license=('BSD')
depends=('ncurses')
source=('git://git.2f30.org/noice'
        'config.h')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cp "$srcdir/config.h" config.h
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
