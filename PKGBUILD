# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers
pkgver=1.4.16.1
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework'
arch=('any')
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/GPUOpen-LibrariesAndSDKs/AMF/archive/${pkgver}.tar.gz")
sha256sums=('347ee0adcbd600b4d86faf62b98571d22e8f20b8c803a263a825ee3886e631e4')

package() {
    local _dir
    local _file
    while read -r -d '' _file
    do
        _dir="${_file%/*}"
        _dir="${_dir#"AMF-${pkgver}/amf/public/include"}"
        install -D -m644 "$_file" -t "${pkgdir}/usr/include/AMF/${_dir}"
    done < <(find "AMF-${pkgver}/amf/public/include" -type f -print0)
    
    install -D -m644 "AMF-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
