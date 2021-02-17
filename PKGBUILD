# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Dafta <dafta007@gmail.com>

pkgname=feedindicator
pkgver=2.0.0.20171011
_commit=990d56a417be822b7d59da23deada927ab8d2ba6
pkgrel=1
pkgdesc="RSS feed applet written in Python"
arch=('any')
url="https://github.com/feedindicator/${pkgname^}"
license=('GPL3')
depends=('libnotify'
	 'python-configobj'
	 'python-gobject'
	 'python-feedparser')
makedepends=('xdg-utils')
install=${pkgname}.install
source=("${pkgname}-${_commit}.tar.gz::https://github.com/${pkgname}/${pkgname^}/archive/${_commit}.tar.gz"
	"fix-feed-notifications.patch::https://github.com/jnphilipp/${pkgname^}/commit/9565b461e849bbf5985a8c081124d97e3f6216f5.diff"
	fix-makefile.patch)
sha256sums=('ca6b457186fbf9253625cb40d141f637060465566e5c4f296e2a99ae4d09c8ac'
            '94ab00bc7e61aa56ed9288e3e0c563eba5388485631ce3cdbf313d9c968f4836'
            '3f5e4be3e76d61923dab4bd62d9e61c2db8a60ad074b4347961aff0f74b1a6f5')

prepare() {
  mv "${pkgname^}-${_commit}" "${pkgname}-${pkgver}"
  
  # Apply feed notifications and makefile fix patches
  cd "${pkgname}-${pkgver}"
  patch --strip=1 --input="${srcdir}/fix-feed-notifications.patch"
  patch --strip=1 --input="${srcdir}/fix-makefile.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install 
}
