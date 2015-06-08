# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vicare-scheme-git
pkgver=20141216.ae68c14
pkgrel=1
pkgdesc="R6RS scheme implementation, from github's devel branch"
arch=('i686' 'x86_64')
url="http://marcomaggi.github.io/vicare.html"
license=('GPL3')
depends=('gmp')
makedepends=('git')
provides=('vicare-scheme')
conflicts=('vicare-scheme')
install=vicare-scheme.install
source=("vicare-scheme::git://github.com/marcomaggi/vicare.git#branch=devel")
md5sums=('SKIP')
_gitname="vicare-scheme"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "$srcdir"/"$_gitname"
  chmod 700 autogen.sh
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  LDFLAGS="-Wl,-z,noexecstack" ./configure --prefix=/usr --libexecdir=/usr/lib \
	 --enable-maintainer-mode
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
