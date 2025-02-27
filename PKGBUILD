# Maintainer: Volodymyr Vriukalo <vriukalovolodymyr æt protonmail-dot-com>
pkgname=cdecl-pjl-git
pkgver=18.4.1.r124.gd89b781b
pkgrel=1
pkgdesc="C declaration converter with improvements by Paul J. Lucas (development version)"
arch=('ppc' 'ppc64' 'i386' 'x86_64')
url="https://github.com/paul-j-lucas/cdecl"
license=('GPL3')
conflicts=("cdecl" "cdecl-pjl")
provides=("cdecl")
depends=()
makedepends=('autoconf' 'automake' 'm4' 'libtool' 'flex' 'bison' 'git')
source=("git+https://github.com/paul-j-lucas/cdecl.git")
sha256sums=('SKIP')

# Derive the version from git. For example, if `git describe --tags origin/HEAD` returns:
#   cdecl-18.4.1-124-gd89b781b
# this function transforms it into:
#   18.4.1.r124.gd89b781b
pkgver() {
  cd "$srcdir/cdecl"
  git describe --tags origin/HEAD | sed -e 's/^cdecl-//' -e 's/-\([0-9]\+\)-/\.r\1./'
}

build() {
  cd "$srcdir/cdecl"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cdecl"
  make DESTDIR="$pkgdir" install
}
