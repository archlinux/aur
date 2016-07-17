# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=projectcenter
_pkgname=ProjectCenter
pkgrel=1
pkgver=0.6.2
pkgdesc="GNUstep's integrated development environment (IDE)."
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/$_pkgname.html"
license=('GPL')
install=$pkgname.install
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://ftpmain.gnustep.org/pub/gnustep/dev-apps/$_pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('c5104ae18511260f900c6de6cca0bcf39361da1866499102bf2a90e2f05d9473'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
