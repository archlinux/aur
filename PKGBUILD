# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=4.3.3
pkgrel=1
pkgdesc="An alternative to tar"

license=('ISC')
_arch_prefix='debian'
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[0]}")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[1]}")
sha256sums=('db7f7ce8121ec5084ef74e60e72d22f165f6d7d6664a1af5ccdbb956e1f38793'
            '47c9ccf698e4fd5f4d4ba1d9eda8d2aeed67b92cab4e7e901c7cf536fd54b2df')
sha256sums_x86_64=('df09ce9e1741c3a2234f5a399b2f7c2ea64779a1065f2e0d489d23eed26263e5')
sha256sums_aarch64=('0d66c8ec7fd9438629fadcaf64bc1fb253f54190a6a57ec62a59033c2a5aee74')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_${_arch_prefix}_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
