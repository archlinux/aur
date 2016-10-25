# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: anonymous <https://gist.github.com/anonymous/2924244>
_pkgname=swfmill
pkgname=$_pkgname-git
pkgver=r472.28d51a7
pkgrel=1
pkgdesc="xml2swf and swf2xml processor with import functionalities"
arch=('i686' 'x86_64')
url="http://swfmill.org"
license=('GPL')
depends=('libxslt' 'freetype2' 'libpng')
provides=('swfmill')
conflicts=('swfmill')
source=("git+https://github.com/djcsdy/swfmill"
	   swfmill.patch)
md5sums=('SKIP'
         '040743a3be51f078b64fbb855183ca60')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch --forward -p1 -i "$srcdir/$_pkgname.patch"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
