# Maintainer: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>
pkgname=carla-git
pkgver=1.9.7.r6.g3075aa2c
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=("i686" "x86_64")
url="http://kxstudio.sf.net/carla"
license=("GPL2")
conflicts=("carla")
provides=("carla")
depends=("python-pyqt5"
         "fluidsynth"
         "gtk2"
         "gtk3"
         "qt4"
         "liblo"
         "linuxsampler"
         "mxml"
         "ntk-git"
         "fftw"
         "file")
makedepends=("git")
optdepends=("zlib: extra native plugins"
            "zynaddsubfx: zynaddsubfx banks")
source=("$pkgname"::"git://github.com/falkTX/Carla.git")
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  make DEFAULT_QT=5
}

package() {
  cd "$srcdir/$pkgname"
  make DEFAULT_QT=5 DESTDIR="$pkgdir/" PREFIX=/usr install
}

