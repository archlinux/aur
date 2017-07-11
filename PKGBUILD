# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=exo
pkgname=${_pkgname}-devel
pkgver=0.11.4
pkgrel=1
pkgdesc="Extensions to Xfce (Development version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2' 'LGPL')
depends=('libxfce4ui>=4.12' 'gtk2' 'gtk3' 'perl-uri' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('54fc6d26eff4ca0525aed8484af822ac561cd26adad4a2a13a282b2d9f349d84')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
