# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=clunc
pkgver=1.1
pkgrel=2
pkgdesc="Client for LaCie U-Boot NetConsole"
arch=('i686' 'x86_64')
url="http://lacie-nas.org/doku.php?id=clunc"
license=('GPL3')
depends=(glibc sh openbsd-netcat)
makedepends=()
source=("ftp://lacie-nas.org/tools/$pkgname-$pkgver.tar.gz")
md5sums=('2b9d7ac203dfc3b939d5fe1ae0a723be')
sha1sums=('813c54e8df5735bfcd306a9da2c9f3a991df180d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/NC_CMD="nc/\0.openbsd/' clunc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install clunc "$pkgdir/usr/bin/clunc"
  install build/clunc-open "$pkgdir/usr/bin/clunc-open"
}

# vim:set ts=2 sw=2 et:
