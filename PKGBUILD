# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Zakros

_pkgauthor=aretext
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=1.6.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Minimalist text editor that never slows you down."
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a5ef2cb21450c5d1f6877554376d7658853941ec511e86de48c4de0cd4748c03')
sha256sums_aarch64=('76d130c85c7cf6574e32f754fe14714cef6a3d4f9d73ff90fb48b91355654218')


case ${CARCH} in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
    ${arch[1]})
        _CARCH=${_barch[1]}
        ;;
esac

package() {
    cd "${_pkgname}_${_pkgvername}_linux_${_CARCH}"/

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "./docs/" || exit

    for doc in ./*; do
        doc_name="${doc%.*}"
        doc_ext=${doc##*.}

        install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc_name^^}.${doc_ext}"
    done
}
