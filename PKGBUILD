# Maintainer: Hanspeter Portner <dev[at]open-music-kontrollers[dot]ch>
pkgname=dfuse_pack
pkgver=0.10.0
pkgrel=1
pkgdesc="A DfuSe packer (USB device firmware upgrade STMicroelectronics extension)"
arch=('i686' 'x86_64')
url="https://github.com/OpenMusicKontrollers/dfuse_pack/"
license=('Artistic2.0')
depends=('glibc')
makedepends=('pkg-config' 'cmake')
source=(https://github.com/OpenMusicKontrollers/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('21810f66c5b1664923319e64b8f62190')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
  cmake \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="$pkgdir/" install
}
