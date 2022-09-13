# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=gerbv-git
_pkgname=gerbv
pkgver=2.9.2.r3.g319a8af
pkgrel=1
pkgdesc="An open source Gerber file (RS-274X only) viewer"
url="https://github.com/gerbv/gerbv"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
provides=('gerbv')
conflicts=('gerbv')
optdepends=('cairo: for better graphics')
makedepends=('git' 'gettext')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build () {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
              --disable-update-desktop-database 
  make 
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install 
}
