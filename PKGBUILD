# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=8.2.1
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Matrix
_gitname=pvr.nextpvr
_kodiver=19.0
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('ebe2b1f96b49c08c5960a6f75da6cb3cfc0cc30d6fafe43b77d2f2249915b752'
            'f7ef8a6f45862ae3b7ebfce4950d74f534be3cb4a0e67ce640963746b3f668f2')

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

