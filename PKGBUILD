# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
_pkgname='ztoim'
pkgver='8.19.17.8';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
_filename=CgRRbWQvw8eAEzLpBfppS6v8lzk.AppIma
source=(
  "https://fscdn.zto.com/fs41/M07/6A/A5/${_filename}"
)

md5sums=('413be6890c4a1d28719cb84d5ccc7b8d')
sha256sums=('19cf722fa0c122009af403fcd7e2632f99f0d92ddf22e6bc38ba392d13c1c846')

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
