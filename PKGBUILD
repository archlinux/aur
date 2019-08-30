# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=amf-headers-git
pkgver=1.4.14.r6.g95220c0
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
    cd AMF
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd AMF
    
    mkdir -p "${pkgdir}/usr/include/AMF"
    
    local _dir
    while read -r -d '' _dir
    do
        cp -a "$_dir" "${pkgdir}/usr/include/AMF"
    done < <(find ./amf/public/include -maxdepth 1 -mindepth 1 -type d -print0)
    
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
