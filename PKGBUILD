# Contributor: tsester <univ@lavabit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=agedu-svn
pkgver=10297
pkgrel=1
pkgdesc="Track down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('custom:MIT')
makedepends=('subversion' 'halibut')
depends=('glibc')
provides=('agedu')
conflicts=('agedu')
source=("svn://svn.tartarus.org/sgt/agedu")
md5sums=('SKIP')
_svnmod=agedu

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_svnmod"
  ./mkauto.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod"
  make DESTDIR="$pkgdir/" install  
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
