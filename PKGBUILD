# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=20.4.0
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Nexus
_gitname=pvr.nextpvr
_kodiver=20.0
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-pvr/${_gitname}/archive/refs/tags/${pkgver}-${_koditarget}.tar.gz"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://github.com/xbmc/xbmc/archive/refs/tags/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('9b9ae55b126ee0ca42a94d2a447167c0d61be36de336a4b236c0879b9b0832e3'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79')

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

