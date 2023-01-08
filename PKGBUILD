# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=gerbv-git
_pkgname=gerbv
pkgver=2.9.6.r1.g6b4f6ba
pkgrel=1
epoch=3
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
prepare() {
  cd $_pkgname
  sed -i -e "s/m4_esyscmd(utils\/git-version-gen.sh [0-9.]*)/$pkgver/" configure.ac
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
