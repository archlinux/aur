# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.42
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
sha256sums=('f3b009bb73e3251378063b6f09786609cd4c061f3f8bf552f0ea663245c045c9')

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
