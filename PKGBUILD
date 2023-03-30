# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
_pkgname='ztoim'
pkgver='8.1.10';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
_filename=CgRReWQlXGyABqwLBfmYf8VW6Qo.AppIma
source=(
  "https://fscdn.zto.com/fs41/M08/C0/C9/${_filename}"
)

md5sums=('9e0eeca27f56c78a0bf9079848b020d9')
sha256sums=('6d88efb81bb46cc6f5a4ec19a5e3e947ef5aac4b941bc4630c4eaed92d1d1cc0')

options=(!strip)
prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    eval ./${_filename} --appimage-extract "*/*/*/*/*x*/apps/*.png"
    eval ./${_filename} --appimage-extract "*/*/applications/*.desktop"
}


package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
    # Install Exec Script
    ExecScript="#!/bin/sh\nexec /opt/appimages/${_filename} \"\$@\""
    install -dm755 "${pkgdir}/usr/bin"
    echo -e $ExecScript > "${pkgdir}/usr/bin/${_pkgname}"
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
