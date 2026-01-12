# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Zakros

_pkgauthor=aretext
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=1.6.1
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
sha256sums_x86_64=('6ea528f27b0731134b785301a84332e5d63c9bec8b51d5ba540330c1c1dc3e0a')
sha256sums_aarch64=('e29860ccdb5b388d3713537636dc2ab1e30b98935741d070472e0dbeacbebf76')


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
