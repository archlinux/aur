# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=gmastermind.app
_pkgname=GMastermind
pkgrel=1
pkgver=0.6
pkgdesc="An implementation of the well-known Mastermind game."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/gmastermind/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('188bb6ebc30838af8e35b7a0bc1af32051ceb0a6011806ada0e7b77e2b07dea7')

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
