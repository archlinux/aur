pkgname=xava-git
_pkgname=xava
pkgver=0.6.1.2.r56.g6d2e1d0
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'libx11' 'sdl2' 'portaudio' 'sndio' 'mesa')
makedepends=('cmake' 'git')
source=('git+https://github.com/nikp123/xava')
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build
  cmake ..
  make
}

package() {
  cd $_pkgname
  install -Dm755 build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 assets/desktop/"$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
  install -Dm644 example_files/config "$pkgdir"/usr/share/xava/config
}

