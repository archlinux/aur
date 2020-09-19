# Contributor: Jakob Gruber (jakob dot gruber at kabelnet dot at)
# Maintainer: Jack Rubacha (rubacha dot jack03 at gmail dot com) 
_pkgname="mobile-broadband-provider-info"
pkgname="${_pkgname}-git"
pkgver=20190618.r16.g402655a
pkgdesc="Mobile broadband provider database."
pkgrel=1
arch=('any')
provides=('mobile-broadband-provider-info')
conflicts=('mobile-broadband-provider-info')
url="http://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/"
source=("git+https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git")
license=('custom')
makedepends=('git' 'libxslt')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd $_pkgname
  make check
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
