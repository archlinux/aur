# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=electricfence
pkgver=2.2.4
pkgrel=1
pkgdesc="A malloc(3) debugger that uses virtual memory hardware to detect illegal memory accesses."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://packages.debian.org/sid/electric-fence"
depends=('glibc' 'bash')
source+=("http://archive.ubuntu.com/ubuntu/pool/universe/e/electric-fence/electric-fence_${pkgver}.tar.gz"
	"ef.sh")
md5sums=('78197d625452a9bc2d171e47bce0ddff'
         '215c183e71fa6f8d40cbd2fe65c860c9')

build() {
	make -C "${srcdir}/electric-fence-2.2.3"
}

package() {
	cd "${srcdir}/electric-fence-2.2.3"

	# Mimic the Makefile since it is pretty broken
	install -D -m755 ../ef.sh         "${pkgdir}"/usr/bin/ef
	install -D -m644 libefence.a      "${pkgdir}"/usr/lib/libefence.a
	install -D -m755 libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so.0.0
	ln -s libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so.0
	ln -s libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so
	install -D -m644 libefence.3      "${pkgdir}"/usr/man/man3/libefence.3
}
