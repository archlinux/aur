# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>

pkgname=libcitadel
_gitname=citadel
pkgver=v9.01.r0.ga845b4f
_gittag=v9.01
pkgrel=1
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
license=('GPL')
depends=('glibc' 'zlib')
makedepends=('git' 'glibc' 'zlib' 'libtool' 'autoconf' 'make' 'gcc')
conflicts=()
changelog=""
source=("$_gitname::git://git.citadel.org/appl/gitroot/citadel.git#tag=$_gittag")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname/libcitadel"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname/libcitadel"
  make DESTDIR="$pkgdir" install
}
