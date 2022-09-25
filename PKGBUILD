# Maintainer: Francesco La Camera <fm@lacamera.org>
pkgname=nvi
pkgver=1.79
pkgrel=3
pkgdesc="Portable OpenBSD vi, originally distributed as part of 4BSD."
arch=("i686" "x86_64")
url="https://github.com/lacamera/nvi"
license=("BSD")
depends=("libtool" "readline" "ncurses")
source=("git+https://github.com/lacamera/nvi.git")
md5sums=("SKIP")

prepare(){
  cd "$srcdir/$pkgname/build"
  cp -pf /usr/share/libtool/build-aux/config.guess .
  cp -pf /usr/share/libtool/build-aux/config.sub .
}

build(){
  export CPPFLAGS="${CPPFLAGS} -U_FORTIFY_SOURCE"
  cd "$srcdir/$pkgname/build"
  ./configure --prefix="$pkgdir/usr" --program-prefix=n
  make
}

package(){
  cd "$srcdir/$pkgname/build"
  make install
  install -Dm644 "$srcdir/$pkgname/LICENSE"\
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
