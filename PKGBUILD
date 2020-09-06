# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Kingan <kingan201 at gmail dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname='prboom-plus'
pkgver='2.5.1.4'
pkgrel='4'
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom'
url='http://prboom-plus.sourceforge.net/'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
conflicts=('prboom-plus-svn')
source=("http://download.sourceforge.net/prboom-plus/prboom-plus-$pkgver.tar.gz")
sha1sums=('73b3b46c36aa693059f2762dcd807bfd0490f130')

prepare() {
    sed -i -E 's/mktemp/mkstemp/g' $(find "prboom-plus-$pkgver" -type f -name r_demo.c)
}

build() {
  cd "prboom-plus-$pkgver"

  LDFLAGS="-z muldefs" ./configure --prefix=/usr --without-dumb
  make
}

package() {
  cd "prboom-plus-$pkgver"

  make DESTDIR="$pkgdir" gamesdir=/usr/bin install
}
