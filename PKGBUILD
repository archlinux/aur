# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jacek-kurlit
_pkgname=axe
pkgname=${_pkgname}-bin
pkgdesc="Argument execute is xargs alternative that supports arguments ordering"

pkgver=0.3.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '8a1bd194bc8ad5e586b3903950b43f41e11993973330936e55c5febbf592b735')
sha256sums_x86_64=('de36d898fee81ed99027675f2796daf5f84a51089df226b60df211e5b14419c5')


prepare() {
	cd "${srcdir}/" || exit

	mv "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "./${_pkgname}"
	rm -rf "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
