# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Thomas Crescenzi <xsq1104 at aol dot com>

set -u
pkgname='kat5200'
pkgver='0.6.2'
pkgrel='1'
pkgdesc='an emulator for the Atari 5200 console and Atari 8-bit computers'
arch=('i686' 'x86_64')
url='http://kat5200.jillybunch.com/'
license=('GPL')
depends=('zlib' 'sdl' 'sdl_image' 'guichan')
source=("http://kat5200.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c35b14654df2930a23092687a51cf7355aac8921869e13646866437ef9143469')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  env CPPFLAGS='-I/usr/include/SDL' ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make prefix=${pkgdir}/usr install
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
