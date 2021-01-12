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
sha256sums=('1be0b27dac46ba891b955bf8f122151baea6ee05b3c29616a09423250cfd9d3d'
            'ddb1ba2f17057f72d620437fdfc7248199009464fae276a297ae0ecbe43b81f3'
            '6696f48e3aae40a23461f628ec2919850a54b6c4e0818641cefd4f41183cf310'
            '921b0807447292dc35ed4a747081035417035e4a32a97c432021f7791baa855c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../cannonsmash-0.6.6-gcc41.patch
  patch -p1 < ../cannonsmash-0.6.6-sizeof-cast.patch
  patch -p1 < ../cannonsmash-0.6.6-x-inc.patch
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
