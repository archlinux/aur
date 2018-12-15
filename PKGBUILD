# Contributor: Alexej Magura <agm2819*gmail*>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mgrep
pkgver=1.1.2
pkgrel=1
pkgdesc="A multiline grep."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/multiline-grep/"
license=('custom')
depends=('boost-libs')
source=("https://downloads.sourceforge.net/project/multiline-grep/$pkgname-${pkgver}.tar.gz")
md5sums=('e9c16df1344d6485f75037d0fcc3733c')
sha1sums=('61f3366113eedd270384036121fed5c333c9ad27')
sha256sums=('1dc3f892204393cebd73cf1b3a85146aed3625242c2c86cd6afbd0e4a2d8a690')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cat README | sed -e :a -e '$q;N;15,$D;ba' | sed '14d' > copyright
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 mgrep $pkgdir/usr/bin/mgrep
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

