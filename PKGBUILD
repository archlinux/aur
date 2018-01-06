# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=linuxtv-dvb-apps
pkgver=1504
pkgrel=1
_hgrev=d40083fff895
pkgdesc='Linux DVB API applications and utilities'
arch=('x86_64')
url='http://www.linuxtv.org/'
license=('GPL')
depends=('glibc')
makedepends=('mercurial')
source=("hg+http://linuxtv.org/hg/dvb-apps/#revision=$_hgrev")
sha256sums=('SKIP')

pkgver() {
  cd "dvb-apps"
  echo $(hg identify -n)
}

prepare() {
  cd "dvb-apps"
  # Fix build
  sed -i '/$(sharedir)\/dvb\//d' util/scan/Makefile
}

build() {
  cd "dvb-apps"
  make
}

package() {
  cd "dvb-apps"
  make DESTDIR="$pkgdir" install
  # Remove conflict with xbase (FS#37862)
  mv "$pkgdir"/usr/bin/{zap,dvbzap}
}
