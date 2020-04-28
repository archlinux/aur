# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.15.2
pkgrel=3
pkgdesc="Panel for the Xfce desktop environment (development release)"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'garcon' 'libxfce4ui>=4.15.1' 'xfconf' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'python') #for gdbus-codegen
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        "vala_0.48_build_fix.patch::https://git.xfce.org/xfce/xfce4-panel/patch/?id=659d61ee2901ffe1e34f7dbcf5d8213b7a17d142")
sha256sums=('a668b5315268ba5b14b6574edbe00c522f879dea659b75c7742da7140cc3657f'
            '5837420637f100ec5f5170c992932a9f930e958cb34f647d993b031543138b02')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i ../vala_0.48_build_fix.patch
}
	
build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
