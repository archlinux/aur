# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libass-git
pkgver=0.12.0.260.gb2f4d9a
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering"
arch=('i686' 'x86_64')
url='http://code.google.com/p/libass'
license=('BSD')
depends=('fontconfig'
         'fribidi'
         )
makedepends=('git'
             'yasm'
             )
provides=('libass')
conflicts=('libass')
source=('libass::git://github.com/libass/libass.git')
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
  ./configure --prefix=/usr
  make
}

package() {
  cd libass
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
