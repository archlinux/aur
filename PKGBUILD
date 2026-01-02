# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=richardgill
_pkgname=patchy
pkgname=${_pkgname}-bin
pkgdesc="A CLI for generating and applying patches to git repositories"

pkgver=0.0.24
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
            'a73a99984b77548351b94016dc7457f2b4dc7116f0f6d37e4c28f28b3dfbd4e1')
sha256sums_x86_64=('311843f140a506ea1aae8d5c21781e7fc1e73542b6de5e6d5bf36f78c3ba9707')
sha256sums_aarch64=('ad99d0168f234f12645f0888a1b7f09abbe36bcb00bf18e9105438676cec1f46')


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
