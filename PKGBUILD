# Maintainer: aksr <aksr at t-com dot me>
pkgname=sc-git
pkgver=7.16_1.1.0.r78.cbe06b9
pkgrel=1
epoch=
pkgdesc="A free curses-based spreadsheet program."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/sc"
license=('unknown')
groups=()
depends=('ncurses')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('sc')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/sc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/{man/man1,licenses/${pkgname%-*}}
  make prefix="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
}

