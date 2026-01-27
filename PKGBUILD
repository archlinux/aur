# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rasros
_pkgname=lx
pkgname=${_pkgname}-bin
pkgver=1.1.2
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
sha256sums_x86_64=('9ecf8f05f5284798e67dff6a22108bedb040265d4402dc727b690fa966672b04')
sha256sums_aarch64=('b36a1e09a1810f3a71aad5159b6bc1a7247bd4f98bc42bd2fb085f86e80492a8')

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
