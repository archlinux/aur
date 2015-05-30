# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mario St-Gelais <mario.stg@videotron_dot_ca>

_pkgname=nffm
pkgname=nffm-git
pkgver=r89.7ab56aa
pkgrel=1
pkgdesc="Not a Fancy File Manager, a mouseless ncurses file manager written in C."
arch=('i686' 'x86_64')
url="https://github.com/mariostg/nffm"
license=('GPL')
depends=('ncurses' 'libtar' 'gzip')
makedepends=('git')
provides=('nffm')
backup=('etc/nffm/color.conf' 'etc/nffm/extension.conf')
source=(git://github.com/mariostg/nffm)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  
  mkdir -p "$pkgdir/etc/nffm/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 color.conf "$pkgdir/etc/nffm/color.conf"
  install -Dm644 extension.conf "$pkgdir/etc/nffm/extension.conf"
}
