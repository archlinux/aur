# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
_pkgname=snapd-xdg-open
pkgname=$_pkgname-git
pkgver=r44.6fed357
pkgrel=2
pkgdesc="Software for opening links from snaps in desktop"
arch=('i686' 'x86_64')
url="https://github.com/snapcore/snapd-xdg-open"
license=('GPL')
depends=('glib2')
makedepends=('git')
provides=('snapd-xdg-open')
conflicts=('snapd-xdg-open')
source=("git+https://github.com/snapcore/snapd-xdg-open")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure \
	  --prefix=/usr \
	  --libexecdir=/usr/lib/$_pkgname
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install

  # Include the xdg-open client program
  install src/xdg-open "$pkgdir/usr/lib/$_pkgname/"
}
