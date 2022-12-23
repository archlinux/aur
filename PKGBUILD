pkgname=xfwm4-gaps
pkgver=4.18.0
pkgrel=1
pkgdesc="Xfce's window manager - now with extra gaps"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('intltool')
provides=('xfwm4')
conflicts=('xfwm4')
source=(https://archive.xfce.org/src/xfce/xfwm4/${pkgver%.*}/xfwm4-$pkgver.tar.bz2
        gaps.patch)
sha256sums=('92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b9f77fad0a89d6e5fc13f'
            SKIP)

prepare() {
  cd "$srcdir/xfwm4-$pkgver"
  patch -Np1 -i ../gaps.patch
}

build() {
  cd "$srcdir/xfwm4-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd "$srcdir/xfwm4-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
