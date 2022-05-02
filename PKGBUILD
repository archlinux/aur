# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=iverilog-git
_gitname=$(printf ${pkgname%%-git})
_gitauthor=steveicarus
pkgver=s20150603.r1490.g0a86773c5
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
source=("git+https://github.com/$_gitauthor/$_gitname.git")
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
  make prefix="$pkgdir/usr" install
}
