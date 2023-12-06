# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam
pkgname=${_base}-bin
pkgver=1.9.0
pkgrel=2
pkgdesc="Transliteration and reverse transliteration for Indian languages - Go port of libvarnam"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('AGPL3')
makedepends=('unzip')
depends=('go')
provides=('govarnam')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_base}-${pkgver}-${arch}.zip")
sha256sums=('d6c0017f62bc1d1816e799984529b62a3bc1d6c37e4dbd6f9b0b13b57e7446fc')
optdepends=('govarnam-ibus: Ibus engine support'
            'govarnam-schemes: Language schemes support')

prepare() {
	cd "${_base}"-"${pkgver}"-"${arch}"
	sed -i 's/prefix=\/usr\/local/prefix=\/usr/' govarnam.pc
}

package() {
	cd "${_base}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnamcli "${pkgdir}/usr/bin/varnamcli"

	install -Dm 644 libgovarnam.so "${pkgdir}/usr/lib/libgovarnam.so.${pkgver}"
	ln -s /usr/lib/libgovarnam.so.${pkgver} "${pkgdir}/usr/lib/libgovarnam.so"

	install -Dm 644 govarnam.pc "${pkgdir}/usr/lib/pkgconfig/govarnam.pc"

	mkdir -p "${pkgdir}/usr/include/libgovarnam"
	cp -a --no-preserve=ownership *.h "${pkgdir}/usr/include/libgovarnam/"
}
