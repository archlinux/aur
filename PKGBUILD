# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=gspca-kinect2
pkgname=${_pkgbase}-dkms
pkgver=1.1
pkgrel=1
pkgdesc="A kernel module for using the Kinect v2 (XBox One) as a video/webcam."
url="https://github.com/jm2/gspca-kinect2"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel'
            'v4l2loopback-dkms: Enable webcam compatibility via systemd service')
source=(
    "git+https://github.com/jm2/gspca-kinect2"
)
sha512sums=('SKIP')

package() {
    install -Dm644 "${srcdir}/${_pkgbase}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    install -Dm644 "${srcdir}/${_pkgbase}/${_pkgbase}-loopback.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}-loopback.service"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${_pkgbase}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
    cp -r "${srcdir}/${_pkgbase}"/{LICENSE,Makefile,README.md,dkms.conf,gspca.c,gspca.h,kinect2.c,kinect2.h} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
