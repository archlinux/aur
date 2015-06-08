# Maintainer: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>

pkgname=carla-git
pkgver=1.9.6.r118.g3130631
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla')
provides=('carla')
depends=("python-pyqt4"
         "clthreads"
         "fluidsynth"
         "gtk2"
         "gtk3"
         "liblo"
         "linuxsampler-svn"
         "mxml"
         "zita-convolver"
         "zita-resampler"
         "clxclient"
         "ntk-git"
         "qt5-base"
         "libpng12")
makedepends=('git')
optdepends=("pygtk: NekoFilter UI"
            "zlib: extra native plugins"
            "zynaddsubfx-git: zynaddsubfx banks")
source=("$pkgname"::'git://github.com/falkTX/Carla.git')
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed 's/libpng12/libpng/' -i "source/Makefile.mk"
}

build() {
  cd "$srcdir/$pkgname"
  make EXPERIMENTAL_PLUGINS=true
}

package() {
  cd "$srcdir/$pkgname"
  make EXPERIMENTAL_PLUGINS=true DESTDIR="$pkgdir/" PREFIX=/usr install
}

