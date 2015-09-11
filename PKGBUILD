# Contributor: kaptoxic
# Contributor: xduugu
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: Arthur Skowronek <eisensheng@mailbox.org>

_pkgname=rtmpdump
pkgname=librtmp0
pkgver=20121230
pkgrel=2
pkgdesc="Tool to download rtmp streams. This is the old version for compatibility reasons."
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('openssl')
options=(!makeflags !docs !libtool)
#git://git.ffmpeg.org/rtmpdump 
source=(https://sources.archlinux.org/other/packages/${_pkgname}/${_pkgname}-git-$pkgver.tar.xz)
sha256sums=('2612ccbc041281c90d1fa59d20aec783fa3ef29de952323d8d89699fc3d5c4d2')

build() {
  cd "${_pkgname}-${pkgver}/librtmp/"
  make
}

package() {
  cd "${_pkgname}-${pkgver}/librtmp/"

  mkdir -p "${pkgdir}/usr/lib/"
  make prefix=/usr sbindir=/usr/bin mandir=/usr/share/man DESTDIR="$pkgdir" install_so
  
  rm "${pkgdir}/usr/lib/librtmp.so"
}

