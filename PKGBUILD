_pkgbasename=libseccomp
pkgname=lib32-libseccomp
pkgver=2.4.4
pkgrel=1
pkgdesc='Seccomp for 32bit'
url="https://github.com/seccomp/libseccomp"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glibc' 'gperf')
makedepends=('gcc-multilib')
source=(https://github.com/seccomp/libseccomp/releases/download/v${pkgver}/libseccomp-${pkgver}.tar.gz)
sha256sums=('4e79738d1ef3c9b7ca9769f1f8b8d84fc17143c2c1c432e53b9c64787e0ff3eb')

build() {
    export CFLAGS="$CFLAGS -m32"
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	./configure \
     --prefix=/usr \
     --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	make install DESTDIR="${pkgdir}"

	rm -rf "${pkgdir}"/usr/{include,share,bin}
}
