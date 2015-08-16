# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=reaver-wps-fork-t6x
pkgver=1.5.2
pkgrel=1
pkgdesc="Brute force attack against Wifi Protected Setup mod with Pixie Dust Attack"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/t6x/reaver-wps-fork-t6x"
license=('GPL2')
depends=('libpcap' 'sqlite3' 'pixiewps')
backup=('etc/reaver/reaver.db')
replaces=('reaver' 'reaver-svn' 'reaver-git')
conflicts=('reaver' 'reaver-svn' 'reaver-git')
provides=('reaver')
source=("https://github.com/t6x/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b68d988ba7546949b74f3d89ebf9efbd745806906b717f3db7644ea4b12c63b6')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/reaver "$pkgdir/usr/bin/reaver"
  install -Dm755 src/wash "$pkgdir/usr/bin/wash"
  install -Dm644 src/reaver.db "$pkgdir/etc/reaver/reaver.db"
  install -Dm644 docs/README "$pkgdir/usr/share/doc/reaver/README"
  install -Dm644 docs/reaver.1.gz "$pkgdir/usr/share/man/man1/reaver.1.gz"
}
