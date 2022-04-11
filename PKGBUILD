_pkgbasename=libseccomp
pkgname=lib32-libseccomp
pkgver=2.5.3
pkgrel=1
pkgdesc='Seccomp for 32bit'
url="https://github.com/seccomp/libseccomp"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glibc' 'gperf')
makedepends=('gcc-multilib')
source=(https://github.com/seccomp/libseccomp/releases/download/v${pkgver}/libseccomp-${pkgver}.tar.gz)
sha256sums=('59065c8733364725e9721ba48c3a99bbc52af921daf48df4b1e012fbc7b10a76')

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
