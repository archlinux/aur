# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Zakros

_pkgauthor=aretext
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=1.6.2
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
sha256sums_x86_64=('5c1f050b34e588d505cbfb265b809159489401f6cfb292e8ca85688c6d7533b3')
sha256sums_aarch64=('7b90fa9d76568169fbbe20c9c74906c887ec30e1ed8c3f635560e9e3b41febdb')


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
