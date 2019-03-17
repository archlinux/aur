# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: pukyxd
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=warmux
pkgver=11.04.1
pkgrel=10
pkgdesc="Clone of turn-based artillery games like Scorched Earth or Worms (formerly known as Wormux)"
arch=('i686' 'x86_64')
url="http://gna.org/projects/warmux/"
license=('GPL')
depends=('libxml++' 'sdl_image' 'sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'sdl_net' 'curl' 'gcc-libs' 'libxml2')
replaces=('wormux' 'warmux-data')
conflicts=('warmux-data')
source=("https://github.com/a-team/wormux/archive/master.zip"
        'include-zlib.patch'
        'return-null.patch'
		'curl-ptr.patch'
		)
sha256sums=('ca6caf7973d0a8e45e9c5b6f7e5b884f836f390204d53c6d2a1c340ab095e76f'
			'665c4a64e54478491284f6cb6251bd58f96ba81671a7c439cffe175b86462852'
            '0e0692fb2acc5697c3083deeff41dcdb055f3330cbac146ebab4aa0f021ad03c'
            'de232b7f2264f9d576ba77f43f79dc698f6ba987d059468f5b2bb5f40cf644d3'
			)

prepare() {

  cd $srcdir/wormux-master

  # libpng fix
  patch -Np1 < ../include-zlib.patch

  # compilation fixes
  echo "==> return-null.patch"
  patch -Np0 < ../return-null.patch
  echo "==> curl-ptr.path"
  patch -Np1 < ../curl-ptr.patch

}

build() {

  cd $srcdir/wormux-master
  ./configure --prefix=/usr
  make

}

package() {

  cd $srcdir/wormux-master
  make DESTDIR="$pkgdir" install

}
