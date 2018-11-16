# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=pixman-git
pkgver=0.35.1.2348.489fa0d
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64)
url="http://xorg.freedesktop.org"
license=('custom')
depends=('glibc')
provides=('pixman')
conflicts=('pixman')
source=("git://anongit.freedesktop.org/pixman")
sha1sums=('SKIP')

pkgver () {
	cd pixman
	
	 for i in pixman_major pixman_minor pixman_micro; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo ${_pixman_major}.${_pixman_minor}.${_pixman_micro}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd pixman
  ./autogen.sh --prefix=/usr --disable-static
  make
}

#check() {
#  cd pixman
#  make check
#}

package() {
  cd pixman
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/pixman"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/pixman"
}
