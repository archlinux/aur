# Maintainer: Balazs Ruzsa <ruzsa.balazs@gmail.com>
pkgname=retro-debugger-git
pkgver=v0.64.66.r1.83245f8
pkgrel=1
pkgdesc="Multiplatform debugger APIs host for retro computers: C64 (Vice), Atari800 and NES (NestopiaUE)"
arch=(x86_64)
url="https://github.com/slajerek/RetroDebugger"
license=('custom')
depends=('sdl2' 'glib2' 'gtk3' 'alsa-lib' 'glew' 'libx11' 'libxcb' 'sndio' 'freetype2' 'zlib')
makedepends=('git')
provides=("${pkgname%-git}")
source=(
  'RetroDebugger::git+https://github.com/slajerek/RetroDebugger.git'
  'MTEngineSDL::git+https://github.com/slajerek/MTEngineSDL.git'
)
md5sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
	cd "$srcdir/RetroDebugger"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/MTEngineSDL"
	cd "$srcdir/RetroDebugger"
}

build() {
	cd "$srcdir/MTEngineSDL"
  mkdir -p build
  cd build
  cmake ..
  make

	cd "$srcdir/RetroDebugger"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
	cd "$srcdir/RetroDebugger/build"
  mkdir -p "$pkgdir/usr/bin"
  install -m 0755 retrodebugger "$pkgdir/usr/bin"
}
