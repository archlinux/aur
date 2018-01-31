# Maintainer: Laël Guillemenot <zeppelinlg@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: pukyxd
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=warmux-git
pkgver=e0dc503
pkgrel=1
pkgdesc="Clone of turn-based artillery games like Scorched Earth or Worms (formerly known as Wormux)"
arch=('i686' 'x86_64')
url="http://gna.org/projects/warmux/"
license=('GPL')
depends=('libxml++' 'sdl_image' 'sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'sdl_net' 'curl' 'gcc-libs' 'libxml2')
replaces=('wormux' 'warmux-data')
conflicts=('warmux-data')
source=("$pkgname::git://github.com/a-team/wormux.git"
        'include-zlib.patch'
        'gcc-fix.patch'
        'return-null.patch'
        'curl-ptr.patch')
sha256sums=('SKIP'
            '665c4a64e54478491284f6cb6251bd58f96ba81671a7c439cffe175b86462852'
            '3f271dc6249ababe919733268c34464fc3050fc7c2b0329e9017f1b32c7760f5'
            '0e0692fb2acc5697c3083deeff41dcdb055f3330cbac146ebab4aa0f021ad03c'
            'de232b7f2264f9d576ba77f43f79dc698f6ba987d059468f5b2bb5f40cf644d3')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g'
}

prepare() {

  cd "$pkgname"

  # libpng fix
  patch -Np1 < ../include-zlib.patch

  # compilation fixes
  #patch -Np1 < ../gcc-fix.patch
  patch -Np0 < ../return-null.patch
  patch -Np1 < ../curl-ptr.patch

}

build() {

  cd "$pkgname"
  ./configure --prefix=/usr
  make

}

package() {

  cd "$pkgname"
  make DESTDIR="$pkgdir" install

}
