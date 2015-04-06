# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: John Pate <jkpate@jkpate.net>

pkgname=naev-git
_pkgname=naev
pkgdesc="2d action/rpg space game similar to Escape Velocity, development branch"
pkgver=0.6.0.r65.ga1f430f
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="http://naev.org/"
depends=('sdl2_image' 'sdl2_mixer' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'binutils' 'libgl' 'libzip')
makedepends=('git')
provides=('naev' 'naev-data')
conflicts=('naev' 'naev-data')

source=('git://github.com/naev/naev.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^naev-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
