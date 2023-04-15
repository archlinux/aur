pkgname=xview-64bit
_pkgname=xview
pkgver=3.2p1.4_25.16
_pkgver=${pkgver//_/-}
_ver=${pkgver: 0: 7}
pkgrel=1
pkgdesc="an OPEN LOOK Toolkit for X Window Files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/xview"
license=('GPL')
depends=('boost-libs' 'libtirpc')
makedepends=('boost' 'unzip' 'imake')
conflicts=()
source=("$pkgname::git+https://github.com/ggodd/xview-64bit.git"
	"xview-build.patch")
sha256sums=('SKIP'
            '1982468406a86dfab0efebdcb263432252433ecc326c498278d9ebe30186a7e5')
prepare() {
  cd $srcdir/$pkgname
  patch -p1 < $srcdir/xview-build.patch
}
build() {
  cd $pkgname 
  OPENWINHOME=$pkgdir/usr bash Build-LinuxXView.bash.amd64 libs clients olvwm contrib
}
package() {
  cd $pkgname 
  OPENWINHOME=$pkgdir/usr X11DIR=$pkgdir/usr/X11R6 bash Build-LinuxXView.bash.amd64 instlibs instclients instolvwm instcontrib
for pkg in xgettext msgfmt
do
  mv $pkgdir/usr/bin/$pkg $pkgdir/usr/bin/$_pkgname-$pkg
  mv $pkgdir/usr/man/man1/$pkg.1.gz $pkgdir/usr/man/man1/$_pkgname-$pkg.1.gz 
done
  rm -rf $pkgdir/usr/X11R6
}
