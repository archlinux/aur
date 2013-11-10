# Maintainer: Cravix < dr dot neemous at gmail dot org >
# Based on edje PKGBUILD wrote by Ronald van Haren <ronald.archlinux.org>


pkgname=terminology-git
_pkgname=terminology
pkgver=0.3.0.568.bf3e2ab
pkgrel=1
pkgdesc="Terminal emulator for e17, successor of previous eterm"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl-git' 'elementary-git')
makedepends=('git')
provides=('terminology')
conflicts=('terminology')
options=('!libtool')
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  echo $(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 "$srcdir/$_pkgname/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
