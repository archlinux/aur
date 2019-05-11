# Maintainer: <mumei AT airmail DOT cc>

_pkgname=Charmap
pkgname=charmap.app
pkgrel=1
pkgver=0.3
pkgdesc='Charmap is a powerful character map'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/charmap'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.gnu.org/releases/charmap/charmap-0.3rc1.tar.gz"
        "http://http.debian.net/debian/pool/main/c/charmap.app/charmap.app_0.3~rc1-3.debian.tar.xz")
sha256sums=('3a877322100f20da98aaeada85b639d15eef7dced4ca635c91cf4f6c3295765e'
            '43ca5968c4af87fe225a67db0efadbe15f7aa8e9c05fad1b83f8829f1938f644')

prepare() {
  cd "charmap-$pkgver"
  for patch in ../debian/patches/*.patch; do 
    patch < $patch
  done
}

build() {
  cd "charmap-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "charmap-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
