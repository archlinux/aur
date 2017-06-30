# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libass-git
pkgver=0.13.7.0.g9fb3840
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
provides=('libass'
          'libass.so'
          )
conflicts=('libass')
source=('git+https://github.com/libass/libass.git')
sha256sums=('SKIP')

pkgver() {
  cd libass
  echo "$(git describe --long --tags | tr - .)"
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
