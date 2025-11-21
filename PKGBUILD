# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=2.3
pkgrel=1
pkgdesc="An alternative to tar"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('ISC')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_debian_${arch[0]}")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_debian_${arch[1]}")
sha256sums=('bf08b2cc97b00a4d926624446506713f9e88abaeeedbfcb9f7e1d8e290fe6860'
            '3021fcb84e40eff31d57ddd8d86740b407d15a2be8a6403433c326d760849553')
sha256sums_x86_64=('80eaa0ba949a1dfb18caf882e65f39e03338332db62e51458c6f86d073e5e49c')
sha256sums_aarch64=('1dc1c94fe4f04e7d1cae4b6ea074b5ae40479c124b17ad9825fcfe6c5b368b4d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_debian_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
