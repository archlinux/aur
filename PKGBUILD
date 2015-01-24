# $Id: PKGBUILD 109121 2011-02-06 10:44:42Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Hyperair <hyperair@gmail.com>

pkgname=podsleuth
pkgver=0.6.7
pkgrel=1
pkgdesc="Tool to discover detailed information about Apple iPods"
arch=('any')
url="http://download.banshee-project.org/podsleuth/"
license=('MIT')
options=(!makeflags)
depends=('ndesk-dbus>=0.6.0' 'sg3_utils>=1.26' 'hal>=0.5.11')
replaces=('libipoddevice')
source=(http://download.banshee.fm/podsleuth/${pkgver}/${pkgname}-${pkgver}.tar.bz2
	sg3_utils-1.26.patch)
md5sums=('987abf0992193ebc526952f86f64a72c'
         'de3b52555f18c503392e941faebc37e5')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd "${srcdir}/${pkgname}-${pkgver}"
#  patch -Np1 -i "${srcdir}/sg3_utils-1.26.patch"
#  aclocal -I m4
#  autoconf
#  automake
  ./configure --prefix=/usr \
   --with-dbus-sys=/etc/dbus-1/system.d/
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/var/cache/podsleuth"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
