# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=electricfence
pkgver=2.2.6
pkgrel=1
pkgdesc="A malloc(3) debugger that uses virtual memory hardware to detect illegal memory accesses."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://packages.debian.org/sid/electric-fence"
depends=('glibc' 'bash')
source+=("http://archive.ubuntu.com/ubuntu/pool/universe/e/electric-fence/electric-fence_${pkgver}.tar.gz"
	"ef.sh")
sha512sums=('ba58aa854dcf0749dc0881aa7d947da878ad1f73f58a735b6bc8b04d39bebbe2f9c5c94443d57a277e7828d61fc21397605129b2ed10339263b108cbf698be42'
            '8f9c9ac510636d380c5e388c8039435dc66cd488082ef074c6fe2f512ac2a8d286b023184443b0717ef7b7abfa34061474ad59ffade0a9cd510819be5ff6d406')

build() {
	make -C "${srcdir}/work"
}

check() {
	cd "${srcdir}/work"

	./eftest
	./tstheap 3072
}

package() {
	cd "${srcdir}/work"

	make DESTDIR="${pkgdir}" install
	install -D -m755 ../ef.sh "${pkgdir}"/usr/bin/ef
}
