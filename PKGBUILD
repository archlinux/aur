# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers-git
pkgver=1.4.18.r0.g7a83513
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework (git version)'
arch=('any')
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
license=('MIT')
makedepends=('git')
provides=('amf-headers')
conflicts=('amf-headers')
source=('git+https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git')
sha256sums=('SKIP')

pkgver() {
    git -C AMF describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    local _file
    while read -r -d '' _file
    do
        install -D -m644 "$_file" "${pkgdir}/usr/include/AMF/${_file#AMF/amf/public/include}"
    done < <(find AMF/amf/public/include -type f -print0)
    
    install -D -m644 AMF/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
