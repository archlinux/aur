# Maintainer: <mumei AT airmail DOT cc>

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
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Addresses-0.4.8.tar.gz"
        "http://http.debian.net/debian/pool/main/a/addresses-for-gnustep/addresses-for-gnustep_0.4.8-3.debian.tar.xz")
sha256sums=('329531bfd31db1845f3af385c1c2448f308b1bf28af5ee7d4f50f403dbb6ac0a'
            '06d589a414605eff9801518ef2ab77414aac6b66fc5c8164185aee26cc367019')

prepare() {
  cd "$_pkgname-$pkgver"
  for patch in ../debian/patches/*.patch; do 
    patch -p1 < $patch
  done
}

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/AddressManager.app/Resources/AddressManager.desktop" "$pkgdir/usr/share/applications/AddressManager.desktop"
}