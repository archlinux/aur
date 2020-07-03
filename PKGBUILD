pkgname=pdkim-git
pkgver=r31.2ef12ef
pkgrel=1
epoch=
pkgdesc="A C/C++ library that implements DomainKeys Identified Mail (DKIM) (RFC4871)."
arch=('i686' 'x86_64')
url="https://duncanthrax.net/pdkim/"
license=('GPL')
makedepends=('git')
conflicts=()
replaces=()
source=(Makefile.unix.patch
  git+https://github.com/duncanthrax/pdkim.git)
sha1sums=('ad8ee83c1e7d96b2ce48688950b2ac2c3c36d678'
          'SKIP')
pkgver() {
  cd pdkim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/pdkim"

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include

  patch Makefile.unix < $srcdir/Makefile.unix.patch
  
  make PREFIX="$pkgdir/usr/" -f Makefile.unix  install
}

# vim:set ts=2 sw=2 et:
