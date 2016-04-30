# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libass-git
pkgver=0.12.0.308.g6a61a7a
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/libass/libass'
license=('custom::ISC')
depends=('fontconfig'
         'fribidi'
         )
makedepends=('git'
             'yasm'
             )
provides=('libass' 'libass.so')
conflicts=('libass')
source=('git+https://github.com/libass/libass.git')
sha1sums=('SKIP')

pkgver() {
  cd libass
  echo "$(git describe --always | tr - .)"
}

prepare() {
  cd libass
  ./autogen.sh
}

build() {
  cd libass
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd libass
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
