# Contributor: Alexej Magura <agm2819*gmail*>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mgrep
pkgver=1.0.0
pkgrel=1
pkgdesc="A multiline grep."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/multiline-grep/"
license=('custom')
depends=('boost-libs')
source=("https://downloads.sourceforge.net/project/multiline-grep/$pkgname-${pkgver}.tar.gz")
md5sums=('76a729c879ce95ff19d6ea5ffe165947')
sha1sums=('570ccb10bad49a1d1cbfd652ede09952b318255f')
sha256sums=('4e267c8c420b5337d8efde608ff877cfedb9fe8a107583248ca95683468aa7a1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cat README | sed -e :a -e '$q;N;15,$D;ba' | sed '14d' > copyright
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 mgrep $pkgdir/usr/bin/mgrep
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

