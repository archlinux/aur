# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=iverilog-git
_gitname=$(printf ${pkgname%%-git})
_gitbranch=master
_gitauthor=steveicarus
pkgver=s20141205.r283.g437dc10
pkgrel=1
pkgdesc="Icarus Verilog simulation and synthesis tool"
arch=('i686' 'x86_64')
url="http://iverilog.icarus.com/"
license=('GPL')
depends=('bzip2' 'sh' 'gcc-libs' 'zlib')
provides=("$_gitname")
conflicts=("$_gitname-snapshot" "$_gitname-legacy" "$_gitname")
options=('staticlibs')
makedepends=('gperf' 'bison' 'flex' 'readline')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
  cd "$srcdir/$_gitname"
  sh autoconf.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make -j1 prefix="$pkgdir/usr" install # It failed awhile ago without the -j1, going to leave it.
}
