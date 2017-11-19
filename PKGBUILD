# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.45
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(x86_64)
license=('LGPL')
url="http://www.mono-project.com/docs/gui/gtksharp/"
depends=('mono' 'libglade' 'gtk2')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!makeflags')
source=(https://download.mono-project.com/sources/gtk-sharp212/gtk-sharp-${pkgver}.tar.gz)
sha256sums=('02680578e4535441064aac21d33315daa009d742cab8098ac8b2749d86fffb6a')

build() {
  cd gtk-sharp-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd gtk-sharp-${pkgver}
  make DESTDIR="${pkgdir}" install
}
