# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam
pkgname=${_base}-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages - Go port of libvarnam"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('AGPL3')
makedepends=('unzip')
depends=('go')
provides=('govarnam')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_base}-${pkgver}-${arch}.zip")
sha256sums=('d00a6f4e43993a4b8c96546a3a8afbe04a5d11d0d65ab9dcc5137b0b6857f3dc')

prepare() {
	cd "${_base}"-"${pkgver}"-"${arch}"
	sed -i 's/prefix=\/usr\/local/prefix=\/usr/' govarnam.pc
}

package() {
	cd "${_base}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnamcli "${pkgdir}/usr/bin/varnamcli"

	install -Dm 644 libgovarnam.so "${pkgdir}/usr/lib/libgovarnam.so.1.9.0"
	ln -s "${pkgdir}/usr/lib/libgovarnam.so.1.9.0" "${pkgdir}/usr/lib/libgovarnam.so"

	install -Dm 644 govarnam.pc "${pkgdir}/usr/lib/pkgconfig/govarnam.pc"

	mkdir -p "${pkgdir}/usr/include/libgovarnam"
	cp -a --no-preserve=ownership *.h "${pkgdir}/usr/include/libgovarnam/"
}
