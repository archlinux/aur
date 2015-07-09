# Maintainer: Vincent Ambo <dev@tazj.in>
pkgname=alock-git
pkgver=r91.09d2ad2
pkgrel=3
pkgdesc="Simple transparent screen-lock"
arch=('i686' 'x86_64')
url="https://code.google.com/p/alock/"
license=('MIT')
depends=('libx11' 'pam')
makedepends=('git' 'xmlto')
optdepends=('libxcursor' 'libxrender' 'pam')
conflicts=('alock-svn')
source=('git+https://code.google.com/p/alock/')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/alock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/alock"
  # upstream bug: Configure ignores --prefix option
  sed -i 's/\/usr\/local/\/usr/g' configure
  ./configure --with-pam
  make
}

package() {
  cd "$srcdir/alock"
  make DESTDIR="$pkgdir/" install
}
