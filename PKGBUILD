# Maintainer: envolution
# Contributor: Brian Bidulock <bidulock@openss7.org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=wmmp3
pkgver=0.12
pkgrel=2
pkgdesc="mp3 player dock app for windowmaker: frontend to mpg123"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmmp3"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz"
  wmmp3-0.12-fix-implicit-function-declaration-clang16.patch
  wmmp3-0.12-fno-common.patch
  wmmp3-0.12-x_includes_n_libraries.patch
)
md5sums=('4bbc839c48cb13680f94b2fa133ca423'
         '59324e874d2430ae23b683298b06f650'
         '79ab9fc757007f4e42f6a52baaf361d6'
         '7a28e94dfd20a12c8707ba52b7c4e760')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../wmmp3-0.12-x_includes_n_libraries.patch
  patch -Np1 -i ../wmmp3-0.12-fix-implicit-function-declaration-clang16.patch
  patch -Np1 -i ../wmmp3-0.12-fno-common.patch
  export CFLAGS="-std=c89"
  export CC="gcc"
  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
