# Maintainer: aksr <aksr at t-com dot me>
pkgname=sc-git
pkgver=7.16_1.0.1.r51.gcf2144f
pkgrel=1
epoch=
pkgdesc="A free curses-based spreadsheet program."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/sc"
license=('Public Domain')
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
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
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
  echo "This program is in the public domain." > "$pkgdir"/usr/share/licenses/${pkgname%-*}/LICENSE
}

