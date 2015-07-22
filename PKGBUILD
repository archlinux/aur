# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=tikzit
pkgver=1.1
pkgrel=1
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="http://tikzit.github.io"
license=('GPL2')
depends=('gnustep-base>=1.18.0' 'gtk2>=2.18.0'
         'poppler-glib>=0.10' 'desktop-file-utils')
makedepends=('gcc-objc>=4.6.0' 'automake' 'autoconf' 'flex' 'bison')
optdepends=('texlive-core: previews')
install="tikzit.install"
source=(https://github.com/$pkgname/$pkgname/archive/v${pkgver}.tar.gz)
md5sums=('ca71f1f862136f10965323400be4f34f')

build() {
  source /etc/profile.d/GNUstep.sh
  cd "$srcdir/$pkgname-$pkgver/tikzit"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  source /etc/profile.d/GNUstep.sh
  cd "$srcdir/$pkgname-$pkgver/tikzit"
  make "DESTDIR=$pkgdir" install || return 1
}

# vim: set ts=2 sw=2 et:
