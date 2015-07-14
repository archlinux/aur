# Maintainer: kevku <kevku@gmx.com>
pkgname=reaver-wps-fork-t6x-git
pkgver=r47.ed5a6c5
pkgrel=1
pkgdesc="Brute force attack against Wifi Protected Setup mod with Pixie Dust Attack"
arch=('i686' 'x86_64')
url="https://github.com/t6x/reaver-wps-fork-t6x"
license=('GPL2')
depends=('libpcap' 'sqlite3' 'pixiewps')
backup=('etc/reaver/reaver.db')
replaces=(reaver reaver-svn reaver-git)
conflicts=(reaver reaver-svn reaver-git)
provides=(reaver)
source=($pkgname::git+https://github.com/t6x/reaver-wps-fork-t6x.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/src/reaver" "$pkgdir/usr/bin/reaver"
  install -Dm755 "$srcdir/$pkgname/src/wash" "$pkgdir/usr/bin/wash"
  install -Dm644 "$srcdir/$pkgname/src/reaver.db" "$pkgdir/etc/reaver/reaver.db"
  install -Dm644 "$srcdir/$pkgname/docs/README" "$pkgdir/usr/share/doc/reaver/README"
  install -Dm644 "$srcdir/$pkgname/docs/reaver.1.gz" "$pkgdir/usr/share/man/man1/reaver.1.gz"
}
