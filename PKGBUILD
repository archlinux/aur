# Maintainer: <mumei AT airmail DOT cc>

_pkgname=Gorm
pkgname=gorm
pkgrel=1
pkgver=1.3.1
pkgdesc="GNUstep's easy-to-use interface designer"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/Gorm.html"
license=('GPL')
depends=(
	'gnustep-back'
	'gnustep-base'
	'gnustep-gui'
)
makedepends=(
	'gcc-objc'
	'gnustep-make'
)
source=(https://github.com/gnustep/apps-gorm/releases/download/$pkgname-${pkgver//./_}/$pkgname-$pkgver.tar.gz)
sha256sums=('75ee9e3ee4b76820423e04deb3116bf01bcc26a28c4db85d3a67979673041c9e')

build() {
  cd "gorm-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "gorm-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
