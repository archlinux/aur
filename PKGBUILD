# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=11.0.1
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.8.0' 'randrproto' 'renderproto' 'xextproto' 'xineramaproto' 'videoproto')
conflicts=('xorg-server<1.8.0')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        LICENSE)
sha1sums=('cc82cbacaa90c28b42440f6a197f5167595c8417'
          'f7fad008ca63b6862056f9d1123a81aef053d586')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/" || return 1
}
