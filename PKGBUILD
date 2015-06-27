# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=lbzip2-git
pkgver=2.2.r92.g9aa5ad4
pkgrel=3
pkgdesc="A parallel, SMP-based, bzip2-compatible compression utility"
arch=('i686' 'x86_64')
url="http://lbzip2.org/"
license=('GPL3')
depends=('glibc')
makedepends=('perl' 'gnulib')
provides=('lbzip2')
conflicts=('lbzip2')

_gitname="lbzip2"
source=($_gitname'::git+https://github.com/kjn/lbzip2.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/$_gitname"

  ./build-aux/autogen.sh	
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_gitname"
  
  make check
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR=${pkgdir} install
}
