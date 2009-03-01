# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-vmware
pkgver=10.16.5
pkgrel=2
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.6.0' 'randrproto' 'renderproto' 'xextproto' 'xineramaproto' 'videoproto')
conflicts=('xorg-server<1.6.0')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
	manpage.patch)
md5sums=('6d78c82ea7c2bb0fcb587d7bb4e8f60a' '44de7fe73cf6261d489246bd4f8f0a6c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/manpage.patch" || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
