pkgname=sc68-svn
pkgver=r692
pkgrel=1
pkgdesc='Atari ST and Amiga music player'
arch=(x86_64)
license=(GPL3)
url='https://sourceforge.net/projects/sc68/'
source=('sc68::svn+https://svn.code.sf.net/p/sc68/code/')
depends=(curl libao readline zlib)
makedepends=(subversion)
conflicts=(sc68)
provides=(sc68)
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/sc68"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/sc68"
  tools/svn-bootstrap.sh
}

build() {
  cd "$srcdir/sc68"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/sc68"
  make DESTDIR="$pkgdir" install
}

