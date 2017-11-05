# New Maintainer: Alice W. <aliceweigt@gmail.com>
# Old Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=reaver-wps-fork-t6x
pkgver=1.6.3
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
sha256sums=('261d89494bc585df81ba68acd6b2e256122009f82c3e55d75740f958c25a73fa')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/reaver "$pkgdir/usr/bin/reaver"
  install -Dm755 src/wash "$pkgdir/usr/bin/wash"
  install -Dm644 docs/README "$pkgdir/usr/share/doc/reaver/README"
  install -Dm644 docs/reaver.1.gz "$pkgdir/usr/share/man/man1/reaver.1.gz"
}
