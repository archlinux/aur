# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=graphos.app
_pkgname=Graphos
pkgrel=1
pkgver=0.5
pkgdesc="A vector drawing application centered around bezier paths."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/graphos/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('0195dd6481fd60d24dd95ea15c89683b8db6130b57681a6042c5cc9b4a482c08')

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

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}

