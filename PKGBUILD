# Maintainer: TryA <tryagainprod@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=csmash
pkgver=0.6.6
pkgrel=3
pkgdesc="A 3D table tennis game"
arch=('i686' 'x86_64')
url="http://cannonsmash.sourceforge.net"
license=('GPL')
depends=('libxmu' 'gtk2' 'mesa' 'sdl_image' 'sdl_mixer')
source=(http://prdownloads.sourceforge.net/cannonsmash/$pkgname-$pkgver.tar.gz
        http://kambing.ui.ac.id/gentoo-portage/games-simulation/cannonsmash/files/cannonsmash-0.6.6-gcc41.patch
        http://kambing.ui.ac.id/gentoo-portage/games-simulation/cannonsmash/files/cannonsmash-0.6.6-sizeof-cast.patch
        http://kambing.ui.ac.id/gentoo-portage/games-simulation/cannonsmash/files/cannonsmash-0.6.6-x-inc.patch)
md5sums=('bcf2eddd0f04d58e5dac6d767f41d9af'
         '2ffbd16a7577ab027afa03466bff1ad6'
         '112758236b8f2e754e515d821380787e'
         '76dd644fdfc4521c420f0f63d3365f29')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../cannonsmash-0.6.6-gcc41.patch
  patch -p0 < ../cannonsmash-0.6.6-sizeof-cast.patch
  patch -p0 < ../cannonsmash-0.6.6-x-inc.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-sdl-prefix=/usr --disable-sdltest
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
