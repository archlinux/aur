# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=systempreferences
_pkgname=SystemPreferences
pkgrel=1
pkgver=1.1.0
pkgdesc="An application which allows to manage the settings of many aspects of the gnustep environment and its applications."
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/$pkgname.html"
license=('GPL')
install=$pkgname.install
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/usr-apps/$_pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('c7dffa3b33949e26c319aa2adbda8e9168e51d2f1a0790d5ec0d609a915ec8e0'
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
