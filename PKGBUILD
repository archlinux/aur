#Maintainer: aksr <aksr at t-com dot me>
pkgname=smatch-git
pkgver=0.5.0.r3044.50291fa
pkgrel=1
pkgdesc="A static analysis tool for C."
arch=('i686' 'x86_64')
url="http://smatch.sourceforge.net/"
license=('custom: OSL')
groups=()
depends=()
makedepends=('git' 'llvm')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+git://repo.or.cz/smatch.git"
        LICENSE)
noextract=()
md5sums=('SKIP'
         '6aab00ce8d50d27993f0e2a32bbb0242')
sha1sums=('SKIP'
          '287b284f25f6d6f3088dab4d4cdd05c2dc97749f')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

