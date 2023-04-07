# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
_pkgname='ztoim'
pkgver='8.18.1';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
_filename=CgRReWQvsAiABn3OBfppPw5flgk.AppIma
source=(
  "https://fscdn.zto.com/fs41/M05/D9/54/${_filename}"
)

md5sums=('3a1a8ad0e78d58e1fb5a41123a9c18bc')
sha256sums=('1e271dabdc481a3c6fbe9ef902f16beeffada1e54b07b3c2f6833dffef19d017')

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
