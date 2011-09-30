# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.4.1
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk3' 'avahi' 'libsoup')
makedepends=('intltool' 'gtk-doc' 'gnome-common')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.4/${pkgname}-${pkgver}.tar.xz
        0001-Avoid-use-of-deprecated-G_CONST_RETURN.patch)
sha256sums=('1377defd339122a5ef71509d3b761810c58f178985d655b74bc34760ef4ae49e'
            'd2bcfd72abc4cd74975a70c667c38d88154117d1eef10a8e8b75bc07cb1dde06')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-Avoid-use-of-deprecated-G_CONST_RETURN.patch"
  gnome-autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


