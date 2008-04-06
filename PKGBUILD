# $Id: PKGBUILD,v 1.11 2008/02/01 16:46:17 alexander Exp $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=faac
pkgver=1.26
pkgrel=1
pkgdesc="FAAC is an AAC audio encoder."
arch=(i686 x86_64)
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2' 'glibc')
makedepends=('automake' 'autoconf' 'libtool')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/${pkgname}
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  ./bootstrap
  ./configure --prefix=/usr --with-mp4v2
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m644 ${startdir}/src/${pkgname}/libfaac/kiss_fft/COPYING \
                   ${startdir}/pkg/usr/share/licenses/faac/COPYING.kiss_fft
}
md5sums=('1d7c019bd2dbb4f3101b8937ebc59cf6')
