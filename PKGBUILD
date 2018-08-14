# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=addresses.app
_pkgname=Addresses
pkgrel=2
pkgver=0.4.8
pkgdesc="A versatile Address Book application and framework."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/addresses/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('329531bfd31db1845f3af385c1c2448f308b1bf28af5ee7d4f50f403dbb6ac0a')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/AddressManager.app/Resources/AddressManager.desktop" \
    "$pkgdir/usr/share/applications/AddressManager.desktop"
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