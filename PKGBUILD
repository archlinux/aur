# Maintainer: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=carla-git
pkgver=1.9.7.r16.g5a95517b
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=("i686" "x86_64")
url="http://kxstudio.sf.net/carla"
license=("GPL2")
conflicts=("carla")
provides=("carla")
depends=("python-pyqt5"
         "qt5-svg"
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
optdepends=("pygtk: NekoFilter UI"
            "zlib: extra native plugins"
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
  sed 's/libpng12/libpng/' -i "source/Makefile.mk"
  sed 's/libpng12/libpng/' -i "source/native-plugins/Makefile"
}

build() {
  cd "$srcdir/$pkgname"
  make DEFAULT_QT=5 EXPERIMENTAL_PLUGINS=true
}

package() {
  cd "$srcdir/$pkgname"
  make DEFAULT_QT=5 EXPERIMENTAL_PLUGINS=true DESTDIR="$pkgdir/" PREFIX=/usr install
}
