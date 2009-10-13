# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=10.16.8
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.7.0' 'randrproto' 'renderproto' 'xextproto' 'xineramaproto' 'videoproto')
conflicts=('xorg-server<1.7.0')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
	LICENSE)
md5sums=('25287a202c986b33bd79fbe379c96a16'
         'f846374287a2bae21570ae8de883fb4d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
