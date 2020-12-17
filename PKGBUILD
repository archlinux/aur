# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: John Pate <jkpate@jkpate.net>

pkgname=naev-git
_pkgname=naev
pkgdesc="2d action/rpg space game similar to Escape Velocity, development branch"
pkgver=v0.8.0.r177.gcbeb2c498
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
url="http://naev.org/"
depends=('sdl2_image' 'sdl2_mixer' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'binutils' 'libgl' 'libzip' 'luajit' 'suitesparse')
makedepends=('git' 'intltool' 'zip' 'itstool' 'autoconf-archive' 'fontconfig' 'glu')
provides=('naev' 'naev-data')
conflicts=('naev' 'naev-data')

source=('git://github.com/naev/naev.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname

  meson build --prefix /usr
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"

  DESTDIR="$pkgdir" meson install -C build
}
