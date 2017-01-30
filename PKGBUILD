# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=electricfence
pkgver=2.2.5
pkgrel=1
pkgdesc="A malloc(3) debugger that uses virtual memory hardware to detect illegal memory accesses."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://packages.debian.org/sid/electric-fence"
depends=('glibc' 'bash')
source+=("http://archive.ubuntu.com/ubuntu/pool/universe/e/electric-fence/electric-fence_${pkgver}.tar.gz"
	"ef.sh")
sha512sums=('88398446767453283072c949f9833f678986f0e42cc8bc93ddc1fa280c754d358ca13f23e0b1c1907b2c7ac6d129ce6690afc69a651eababb2a6c7c16aa0af5c'
            '8f9c9ac510636d380c5e388c8039435dc66cd488082ef074c6fe2f512ac2a8d286b023184443b0717ef7b7abfa34061474ad59ffade0a9cd510819be5ff6d406')

build() {
	make -C "${srcdir}/electric-fence"
}

package() {
	cd "${srcdir}/electric-fence"

	# Mimic the Makefile since it is broken
	install -D -m755 ../ef.sh         "${pkgdir}"/usr/bin/ef
	install -D -m644 libefence.a      "${pkgdir}"/usr/lib/libefence.a
	install -D -m755 libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so.0.0
	ln -s libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so.0
	ln -s libefence.so.0.0 "${pkgdir}"/usr/lib/libefence.so
	install -D -m644 libefence.3      "${pkgdir}"/usr/share/man/man3/libefence.3
}
