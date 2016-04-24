# Maintainer: aksr <aksr at t-com dot me>
pkgname=rc-git
pkgver=1.7.4.r499.c95bdf7
pkgrel=1
epoch=
pkgdesc="Independent re-implementation for Unix of the Plan 9 shell (from circa 1992)."
arch=('i686' 'x86_64')
url="https://github.com/rakitzis/rc"
license=('zlib')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/rakitzis/rc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # there must be a cleaner way?
  VER=$(awk 'NR==2 {print $2}' configure.ac | sed 's/\[//;s/\]//;s/)//')
  printf "$VER.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -vi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 EXAMPLES $pkgdir/usr/share/doc/${pkgname%-*}/EXAMPLES
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

