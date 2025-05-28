# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: <mumei AT airmail DOT cc>

pkgname=addresses.app
_pkgname=Addresses
pkgrel=1
pkgver=0.5.0
pkgdesc="A versatile Address Book application and framework."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/addresses/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Addresses-$pkgver.tar.gz"
        "http://deb.debian.org/debian/pool/main/g/gnustep-addresses/gnustep-addresses_0.5.0-2.debian.tar.xz")
sha256sums=('fb074e80c85f48aa57e1c01bcdcd1a5754bade84d61ccf7db7549ef20b1ba4e1'
            '99678ebad0d9ada6b315c2691651c4ae2cd555f5c0459e6bb657101027e96e3a')

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
