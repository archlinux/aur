# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=10.16.9
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
        abi2.patch
        LICENSE)
md5sums=('3b3d38abfa1f8be4b1e26dcd236bc94f'
         'cbc8e0bef13ccec7ceac233cd09233da'
         'f846374287a2bae21570ae8de883fb4d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/abi2.patch" || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/" || return 1
}
