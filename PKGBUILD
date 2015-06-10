# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=mailtc
pkgver=1.4.0
pkgrel=3
pkgdesc="Lightweight GTK2 mail checker for the system tray/notification area of panels."
arch=('i686' 'x86_64')
url="http://mailtc.sourceforge.net"
license=('GPL')
depends=('gtk2')
options=('!emptydirs' '!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
       gdk_display.patch)
sha256sums=('a2aa8aa2b3e12a5698b874a1d5102749f569084feb0726152c29c6ca6f6fb1ab'
            '43ec209624b6368fe4fc0b5d9c1f0a51d699593a42b98a6277b101371536dc9e')

build() {
  export LDFLAGS="-lX11 -lgmodule-2.0"

  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i $srcdir/gdk_display.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
