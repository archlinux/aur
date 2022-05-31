# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=nct6775-master-dkms-git
_pkgbase="${pkgname//-*/}"
pkgver=r164.b2edd29
pkgrel=2
pkgdesc="Nuvoton module for nct67xx chips synced with latest upstream kernel."
arch=('i686' 'x86_64')
url="https://github.com/tonylambiris/nct6775"
license=('GPLv2')
makedepends=('git')
depends=('dkms')
source=("${pkgname}::git+https://github.com/tonylambiris/nct6775"
        "dkms.conf.in")
sha256sums=('SKIP'
            '9ab9c96b13dee285a5e31e5312d7dff4fe36c5de02ceb1431e577e91d8209b63')

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -a LICENSE Makefile README* *.h *.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    cd "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

    sed -e "s/@PKGBASE@/${_pkgbase}/" -e "s/@PKGVER@/${pkgver}/" \
        "${srcdir}/dkms.conf.in" > "dkms.conf"
}
