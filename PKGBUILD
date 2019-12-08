# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xvidcore-svn
pkgver=r2186
pkgrel=1
pkgdesc="High performance and high quality MPEG-4 video codec"
arch=('i686' 'x86_64')
url="https://www.xvid.com/"
license=('GPL2')
depends=('glibc')
makedepends=('subversion' 'nasm')
provides=('xvidcore')
conflicts=('xvidcore')
options=('staticlibs')
#source=("svn+http://anonymous:@svn.xvid.org/trunk")
#sha256sums=('SKIP')


prepare() {
  svn checkout http://svn.xvid.org/trunk --username anonymous --password ""
}

pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk/xvidcore/build/generic"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "trunk/xvidcore/build/generic"

  make DESTDIR="$pkgdir" install
}
