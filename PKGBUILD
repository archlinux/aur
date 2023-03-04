# Maintainer: Mahmut Dikcizgi <boogiepop a~t gmx com>

pkgname=gl4es-git
pkgver=r2623.c156cc6b
pkgrel=1
pkgdesc='OpenGL for GLES Hardware'
arch=('aarch64' 'arm7h')
url='https://github.com/ptitSeb/gl4es'
license=('MIT')
depends=('gcc-libs' 'coreutils')
makedepends=('cmake')
options=(!lto debug strip)
source=(git+https://github.com/ptitSeb/gl4es.git#branch=master)
sha256sums=('SKIP')

build() {
	cd gl4es
	mkdir -p build
	cd build
	cmake .. -DODROID=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
	make -j$(nproc)
}

pkgver() {
  cd gl4es
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  	provides=(gl4es $pkgname)
  	conflicts=(gl4es $pkgname)
  	cd gl4es/build
    DESTDIR="$pkgdir" make install
}
