# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit-git
pkgver=r297
pkgrel=1
pkgdesc="Creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tikzit/"
license=('GPL')
depends=('gtk2>=2.18.0' 'poppler-glib' 'hicolor-icon-theme' 'gnustep-base' 'desktop-file-utils')
makedepends=('git' 'gcc-objc')
provides=('tikzit')
conflicts=('tikzit' 'ploticus')
source=('git+https://github.com/tikzit/tikzit.git')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s" "$(git rev-list --count HEAD)"
}
 
build() {
  cd "$srcdir"/${pkgname%-git}/${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir"/${pkgname%-git}/${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
