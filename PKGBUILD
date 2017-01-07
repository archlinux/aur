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
sha512sums=('02abb353b99b3dd20de062f40c095a60ddfd7895c8998772936ffaf48a9ce899ee41c36f1983aa500b018028694cd35d0927a00d2fe345dc9d6d48b481c9e985'
            '8f9c9ac510636d380c5e388c8039435dc66cd488082ef074c6fe2f512ac2a8d286b023184443b0717ef7b7abfa34061474ad59ffade0a9cd510819be5ff6d406')

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
