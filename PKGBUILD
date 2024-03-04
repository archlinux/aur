# Maintainer:
# Contributor: DetMittens

_pkgname="libcmrt"
pkgname="$_pkgname"
pkgver=1.0.6
pkgrel=2
pkgdesc="Intel C for Media RunTime GPU kernel manager"
depends=('libva>=2.0.0')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
arch=('i686' 'x86_64')

_pkgsrc="cmrt-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/01org/cmrt/archive/$pkgver.$_pkgext")
sha256sums=("ca22e905a2717fc740e703e65a0061a0e11f4ea513ba970bbc10b3bd6d28e6e0")

build() {
  cd "$_pkgsrc"
  autoreconf -v --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" make install
  mv "$pkgdir/usr/etc" "$pkgdir"
}
