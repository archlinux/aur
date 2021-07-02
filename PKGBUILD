_pkgbasename=libseccomp
pkgname=lib32-libseccomp
pkgver=2.5.1
pkgrel=1
pkgdesc='Seccomp for 32bit'
url="https://github.com/seccomp/libseccomp"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glibc' 'gperf')
makedepends=('gcc-multilib')
source=(https://github.com/seccomp/libseccomp/releases/download/v${pkgver}/libseccomp-${pkgver}.tar.gz)
sha256sums=('ee307e383c77aa7995abc5ada544d51c9723ae399768a97667d4cdb3c3a30d55')

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
