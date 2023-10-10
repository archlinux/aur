# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=drumlabooh-git
pkgver=2.0.2.r1.g6870730
pkgrel=1
pkgdesc='LV2/VSTi drum machine that supports Hydrogen, Drumlabooh and SFZ drumkits'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/drumlabooh'
groups=('lv2-plugins' 'pro-audio')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'freetype2' 'libx11' 'libxcomposite' 'libxcursor' 'libxext' 'libxinerama' 'libxrandr' 'libxrender')
provides=("drumlabooh")
conflicts=("drumlabooh")

source=("git+https://github.com/psemiletov/drumlabooh.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/drumlabooh"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/drumlabooh"
	mkdir -p build_dir
	cd build_dir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/drumlabooh"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
