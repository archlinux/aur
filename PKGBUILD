# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=grr.app
_pkgname=Grr
pkgrel=1
pkgver=1.0
pkgdesc="A Rss reader for GNUstep."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/grr/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-gui'
         'librsskit')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('62537cf73b2604cafe541e7cb5cb7eabb0b5da9e43662737efaa7676336a9994')

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

