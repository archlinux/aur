# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=x262-git
pkgver=0.142.2633.bb887aa
pkgrel=1
pkgdesc="x264 with MPEG-2 video support (GIT version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'ffms2')
makedepends=('git' 'yasm')
url="http://git.videolan.org/?p=x262.git"
source=('git://git.videolan.org/x262.git')
provides=('x262')
conflicts=('x262')
sha1sums=('SKIP')

pkgver() {
  cd x262
  echo "$(sh version.sh | grep 'X264_POINTVER' | cut -d '"' -f2 | tr M m | tr ' ' .)"
}

build() {
  cd x262
  ./configure \
    --prefix=/usr \
    --disable-lsmash

  make
}

package() {
  make -C x262 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin/x262"
  mv "${pkgdir}/usr/bin/x264" "${pkgdir}/usr/bin/x262"
}
