# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rasros
_pkgname=lx
pkgname=${_pkgname}-bin
pkgver=1.0.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A small CLI tool that converts selected files into clean, consistent Markdown-fenced blocks, making it easy to provide precise, repeatable context to LLMs"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
#         "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a9239848135a01a5981aaf9e25a9d5e14e00503ff3447e255f73b8f3588c820b')
sha256sums_aarch64=('1583905b2f2578c77ecedec62c8eb653288a784e92e0dfbc0ff09df77d95eb2c')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
