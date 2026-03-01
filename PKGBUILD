# Maintainer yurakaii <danndem@gmail.com>
# Contributor: timescam <timescam at duck dot com>
# Contributor: Celestial Walrus <aur@celestial.cf>

pkgname=cava-git
_pkgname=cava
pkgver=r1136.20a5997
pkgrel=2
pkgdesc='Console-based Audio Visualizer for Alsa. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=(
	'fftw'
	'glibc'
	'iniparser'
	# Input backends
	'alsa-lib'
	'jack'
	'libpipewire'
	'libpulse'
	'portaudio'
	'sndio'
	# Output backends
	'ncurses'
	'sdl2'
)
makedepends=('git' 'xxd' 'autoconf-archive')
source=('git+https://github.com/karlstav/cava.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
	make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
