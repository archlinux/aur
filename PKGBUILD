# Contributor: Alex Merry <dev@randomguy3.me.uk>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tikzit
pkgver=1.1
pkgrel=4
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="https://github.com/tikzit/tikzit.git"
license=('GPL2')
depends=('gnustep-base>=1.18.0' 'gtk2>=2.18.0'
         'poppler-glib>=0.10' 'desktop-file-utils')
makedepends=('gcc-objc>=4.6.0' 'automake' 'autoconf' 'flex' 'bison')
optdepends=('texlive-core: previews')
source=(tikzit-$pkgver.zip::https://github.com/$pkgname/$pkgname/archive/master.zip)
sha256sums=('b0756500fae0029df41cbd6105c48c90a1f60231a9cb5558d73cd319464669ab')

build() {
  cd $pkgname-master/tikzit
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make -j1
}

package() {
  cd $pkgname-master/tikzit
  make -j1 "DESTDIR=$pkgdir" install
}
