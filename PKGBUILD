# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Zakros

_pkgauthor=aretext
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=1.5.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Minimalist text editor that never slows you down."
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('335982823dc6f0e89c4fea6050197456ffe1d356d9140b2af55ac2a40de68b15')
sha256sums_i686=('5beab6d06229bcbbf747019135cfc5a25d0cba9cec0c36aaefd1c6e561055da1')
sha256sums_aarch64=('1171d2b41fa02d481b602cede56ee6ffb65102086a9a693e517d6d7db1b2ce5d')


package() {
    case ${CARCH} in
    ${arch[0]})
        cd "${_pkgname}_${pkgver}_linux_${_barch[0]}"
    ;;
    ${arch[1]})
        cd "${_pkgname}_${pkgver}_linux_${_barch[1]}"
    ;;
    ${arch[2]})
        cd "${_pkgname}_${pkgver}_${_barch[2]}"
    ;;
    esac


    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "./docs/" || exit

    for doc in ./*; do
        doc_name="${doc%.*}"
        doc_ext=${doc##*.}

        install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc_name^^}.${doc_ext}"
    done
}
