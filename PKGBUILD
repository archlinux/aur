# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
pkgname=kma 
pkgver=1.6.6
pkgrel=1
pkgdesc="An ultra-fast mapping method designed to map raw reads directly against redundant databases using seed and extend."
arch=(x86_64)
url="https://bitbucket.org/genomicepidemiology/kma/src/master/"
license=('Apache-2.0')
makedepends=('git')
depends=('zlib' 'glibc')
source=(${pkgname}::git+https://bitbucket.org/genomicepidemiology/kma.git#tag=$pkgver)
sha256sums=('0d16ac9305ebb7292c6906a02e8786baac659ca3e97bc101fd8bf528494c1a11')

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
