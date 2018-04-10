# Maintainer: aksr <aksr at t-com dot me>
pkgname=minised-svn
pkgver=r141
pkgrel=1
pkgdesc="A smaller, cheaper, faster SED implementation."
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/minised/"
license=('custom:BSD-like')
makedepends=('subversion')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("$pkgname::svn+http://svn.exactcode.de/minised/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
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
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

