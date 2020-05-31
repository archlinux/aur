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
    mkdir -p "${pkgdir}/usr/include/AMF"
    
    local _dir
    while read -r -d '' _dir
    do
        cp -a "$_dir" "${pkgdir}/usr/include/AMF"
    done < <(find AMF/amf/public/include -maxdepth 1 -mindepth 1 -type d -print0)
    
    install -D -m644 AMF/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
