# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=astyle-svn
pkgver=r672
pkgrel=2
pkgdesc="A free, fast, and small automatic code formatter"
arch=('i686' 'x86_64')
url="http://astyle.sourceforge.net/"
license=('MIT')
depends=('gcc-libs')
makedepends=('subversion')
provides=("astyle=$pkgver")
conflicts=('astyle')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/astyle/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk/AStyle/build/gcc"

  make release shared static
}

package() {
  cd "trunk/AStyle/build/gcc"

  install -Dm755 "bin/astyle" -t "$pkgdir/usr/bin"

  install -d -m755 "$pkgdir/usr/lib"
  install -m755 "bin"/libastyle.so.* "$pkgdir/usr/lib"
  install -m644 "bin/libastyle.a" "$pkgdir/usr/lib"

  install -d -m755 "$pkgdir/usr/share/doc/astyle"
  install -m644 "../../doc"/* "$pkgdir/usr/share/doc/astyle"

  install -Dm644 "../../LICENSE.md" -t "$pkgdir/usr/share/licenses/astyle"
}
