# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nsnake-git
pkgver=20141013
pkgrel=1
pkgdesc="The classic snake game with textual interface."
arch=('x86_64' 'i686')
url="http://www.github.com/alexdantas/nsnake/"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
conflicts=('nsnake')
source=("$pkgname::git+https://github.com/alexdantas/nsnake.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir}/${pkgname}"
#  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

