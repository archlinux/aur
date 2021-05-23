# Maintainer: nalquas <nalquas.dev@gmail.com>

pkgname=vokey-git
pkgver=0.3.1.r0.gef3eea9
pkgrel=1
pkgdesc="Vokey is a voice-based hotkey application."
arch=('any')
url="https://github.com/nalquas/vokey"
license=('GPL3')
depends=('pocketsphinx' 'sphinxbase' 'libpulse' 'libx11' 'glibc' 'blas' 'lapack' 'libxtst' 'gcc-libs' 'qt5-base' 'alsa-utils' 'festival' 'festival-english')
makedepends=('git' 'nlohmann-json')
provides=('vokey')
conflicts=('vokey')
options=(!makeflags)
source=('git+https://github.com/nalquas/vokey')
md5sums=('SKIP')

_gitname='vokey'

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="${pkgdir}" install
}
