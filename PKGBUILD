# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers-git
pkgver=1.4.16.1.r5.g802f92e
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
    local _dir
    local _file
    while read -r -d '' _file
    do
        _dir="${_file%/*}"
        _dir="${_dir#AMF/amf/public/include}"
        install -D -m644 "$_file" -t "${pkgdir}/usr/include/AMF/${_dir}"
    done < <(find AMF/amf/public/include -type f -print0)
    
    install -D -m644 AMF/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
