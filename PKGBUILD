# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
_pkgname='ztoim'
pkgver='8.21.5.11';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
_filename=CgRRbWRsGOaAOhSdBl_0s_jAT54.AppIma
source=(
  "https://fscdn.zto.com/fs41/M06/10/2C/${_filename}"
)

md5sums=('32b129a1d534ef441409978e6e895737')
sha256sums=('9a07d6286ad9ad01eafb7a2bc477c7b7ad02efd896b29dc457eb24af33a26b46')

options=(!strip)
prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
}


package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
    # Install Exec Script
    ExecScript="#!/bin/sh\nexec /opt/appimages/${_filename} \"\$@\""
    install -dm755 "${pkgdir}/usr/bin"
    echo -e $ExecScript > "${pkgdir}/usr/bin/${_pkgname}"
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
