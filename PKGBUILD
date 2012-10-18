# Contributor: Chris Osgood <archlinux at functionalfuture dot com>
pkgname=libx32-xz
pkgver=5.0.4
pkgrel=1.2
pkgdesc="Library for XZ and LZMA compressed files (x32 ABI)"
arch=('x86_64')
url="http://tukaani.org/xz/"
license=('GPL' 'LGPL' 'custom')
groups=('libx32')
depends=('xz' 'libx32-glibc')
makedepends=('gcc-multilib-x32')
replaces=('libx32-lzma')
conflicts=('libx32-lzma')
provides=("libx32-lzma=${pkgver}")
options=(!libtool)
source=(http://tukaani.org/xz/xz-5.0.4.tar.xz)
md5sums=('161015c4a65b1f293d31810e1df93090')

build(){
	cd "${srcdir}"/xz-${pkgver}
	CC='gcc -mx32' ./configure --prefix=/usr --libdir=/usr/libx32
	make
}

package() {
	cd "${srcdir}"/xz-${pkgver}
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}"/usr/{bin,include,share}
	install -d -m755 "${pkgdir}"/usr/share/licenses/
	ln -sf xz "${pkgdir}"/usr/share/licenses/libx32-xz
}

