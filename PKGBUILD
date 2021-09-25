# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libass-git
pkgver=0.15.2.11.g4c3ace7
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering. (GIT version)"
arch=('x86_64')
url='https://github.com/libass/libass'
license=('custom::ISC')
depends=('fontconfig'
         'fribidi'
         )
makedepends=('git'
             'nasm'
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
  mkdir -p build
}

build() {
  cd libass
  autoreconf -vfi

  cd "${srcdir}/build"
  ../libass/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 libass/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
