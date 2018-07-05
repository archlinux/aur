pkgname=cava-gui-git
_pkgname=cava
pkgver=0.6.1
pkgrel=1
pkgdesc='Console/Graphical Audio Visualizer for Alsa/Pulseaudio'
arch=('i686' 'x86_64')
url='https://github.com/nikp123/cava-gui'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'ncurses' 'libx11' 'sdl2' 'portaudio')
makedepends=('cmake' 'git')
source=('git+https://github.com/nikp123/cava')
conflicts=($_pkgname)
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd $_pkgname
  install -Dm755 build/cava "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm744 example_files/desktop/"$_pkgname".png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/cava.png
  install -Dm744 example_files/desktop/"$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
}


