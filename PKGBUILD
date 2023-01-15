# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=19.0.6
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Matrix
_gitname=pvr.nextpvr
_kodiver=19.5
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-pvr/${_gitname}/archive/refs/tags/${pkgver}-${_koditarget}.tar.gz"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://github.com/xbmc/xbmc/archive/refs/tags/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('45ad0def6bbdb50fc42dc0b8a997e0db758fda42421fa7eb7643466ea512134f'
            '56e0074f27f08496b2a21af5704a15378a2f0979ae3e9fa9a50a2630d0313d19')

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

