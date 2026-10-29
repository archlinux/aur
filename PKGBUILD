# Maintainer: cafreo 

_pkgname=hoard
__pkgname=Hoard
pkgname=${_pkgname}-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="Automatic, versioned game save sync across devices."
arch=('x86_64' 'aarch64')
url='https://github.com/rleeon/hoard'
license=('AGPL3')
depends=()
options=('!debug')
provides=("${_pkgname}" "${_pkgname}d")
conflicts=("${_pkgname}" "${_pkgname}-bin")

source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('3281634d02bf313059e84d62bb3e490b7cb43877bfec0721a23748dc5242fedc')
sha246sums_aarch64=('0237c801731bea9317ddfa12f44ec6492eb6aadcfeb366e31b941f8b73650cec')

prepare() {
    cd "${srcdir}" 
    bsdtar -xf "${_pkgname}_${pkgver}_$CARCH.deb" data.tar.*
    bsdtar -xf data.tar.* -C "${srcdir}"
}

package() {
  # bin
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-cli}"
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}d" "${pkgdir}/usr/bin/${pkgname%-cli}d"
}


