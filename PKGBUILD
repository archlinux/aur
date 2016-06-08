# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit-git
pkgver=1.1.280
pkgrel=2
pkgdesc="Creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tikzit/"
license=('GPL')
depends=('gtk2>=2.18.0' 'poppler-glib' 'hicolor-icon-theme' 'gnustep-base' 'desktop-file-utils')
makedepends=('git' 'gcc-objc')
provides=('tikzit')
conflicts=('tikzit')
source=('git+https://github.com/tikzit/tikzit.git')
md5sums=('SKIP')
_gitname="tikzit"
options=('!makeflags')

pkgver() {
  cd "$srcdir"/$_gitname
    printf "%s.%s" $(git describe --tags | tr -d 'v'|sed s#-#.#g) "$(git rev-list --count HEAD)"
}
 
build() {
  cd "$srcdir"/$_gitname/$_gitname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir"/$_gitname/$_gitname
  make DESTDIR="$pkgdir" install
}
