# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=20.3.1
pkgrel=1
pkgdesc='IPTV Stalker PVR client addon for Kodi'
_koditarget=Nexus
_gitname=pvr.stalker
_kodiver=20.0
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform' 'git')
depends=('kodi')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('8fdd4ab4cf28d7255550b4c351a397b7ce8eb1aa1f12e93bce7d61a951fbd6f3'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79'
            )

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    
    CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"

    cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DADDONS_TO_BUILD=${_gitname} \
            -DPACKAGE_ZIP=1 \
            ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
    make
}
        
package() {
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv .install/${_gitname} "${pkgdir}/usr/share/kodi/addons"
}
