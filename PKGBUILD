# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=richardgill
_pkgname=patchy
pkgname=${_pkgname}-bin
pkgdesc="A CLI for generating and applying patches to git repositories"

pkgver=0.0.26
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums=('5037e2e281dc4311edd18487a9ccc0c0540a5b21ba513f6b3f1763b609a8e554'
            '2589a02e7b3c13432d59b8acf9048bbcaeaf67abcf158ebf3f4a1ff5c2cf3092')
sha256sums_x86_64=('4d031e093d846de718338b357e9291c1ba7c2b376766301ce8c06c44c582e7df')
sha256sums_aarch64=('4a70bee73506dc882cee9704ee7cf83bcbdd26fcb02e09d00e523dfcea5d9398')


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

	install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
