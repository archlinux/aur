# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
pkgname=kma 
pkgver=1.4.17
pkgrel=0
pkgdesc="An ultra-fast mapping method designed to map raw reads directly against redundant databases using seed and extend."
arch=(x86_64)
url="https://bitbucket.org/genomicepidemiology/kma/src/master/"
license=('Apache-2.0')
makedepends=('git')
depends=('zlib' 'glibc')
source=(''kma::git+https://bitbucket.org/genomicepidemiology/kma.git#tag=$pkgver'')
sha256sums=('efd33b858c7c70ab0091125f8ef1220c5203859e130765bba8a2d5c193c8d25a')

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd ${srcdir}/${pkgname}
	install -dm 755 "${pkgdir}"/usr/bin
	for bin in {kma,kma_index,kma_shm}
    do [ -f "$bin" ] || continue
	install -Dm 755 "$bin" "${pkgdir}"/usr/bin/"$bin"
    done
    install -dm 755 "${pkgdir}"/usr/share/doc/${pkgname}
    install -Dm 755 KMAspecification.pdf "${pkgdir}"/usr/share/doc/${pkgname}/
}
