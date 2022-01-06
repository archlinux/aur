# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=19.0.3
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Matrix
_gitname=pvr.nextpvr
_kodiver=19.3
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-pvr/${_gitname}/archive/refs/tags/${pkgver}-${_koditarget}.tar.gz"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://github.com/xbmc/xbmc/archive/refs/tags/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('f9a03f7e61ae69096b149184a1ababa2d98cf2486688022e7b63823047c04496'
            '440f47e475dd8a48e0a6d41349e83b74890f3fbe8275d3e401d3c50f5b9ea09b')

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
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

