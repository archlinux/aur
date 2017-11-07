#Maintainer: aksr <aksr at t-com dot me>
pkgname=smatch
pkgver=1.60
pkgrel=1
pkgdesc="A static analysis tool for C."
arch=('i686' 'x86_64')
url="http://smatch.sourceforge.net/"
license=('custom: OSL')
groups=()
depends=()
makedepends=('git' 'llvm')
provides=('smatch')
conflicts=('smatch')
# replaces=()
# backup=()
# options=()
# install=
source=("$pkgname::git+git://repo.or.cz/smatch.git" LICENSE)
# noextract=()
md5sums=('SKIP'
         '6aab00ce8d50d27993f0e2a32bbb0242')

build() {
  cd "$srcdir/$pkgname"
  git reset --hard $pkgver
  make PREFIX="/usr"
}

check() {
  cd "$srcdir/$pkgname"
  make -k check PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
