# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: <mumei AT airmail DOT cc>

_pkgname=Gorm
pkgname=gorm
pkgrel=1
pkgver=1.5.0
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
source=(https://github.com/gnustep/apps-gorm/archive/refs/tags/$pkgname-${pkgver//./_}/$pkgname-$pkgver.tar.gz)
sha256sums=('21bb0ba0f9a24ab5ef47e455198c4b2e0e8c9d17e7b0853bafbd89b80127bb2b')

build() {
  cd "apps-gorm-$pkgname-${pkgver//./_}"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "apps-gorm-$pkgname-${pkgver//./_}"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
