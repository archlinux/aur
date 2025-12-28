# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=21.3.2
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Omega
_gitname=pvr.nextpvr
_kodiver=21.3
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/kodi-pvr/${_gitname}/tar.gz/refs/tags/${pkgver}-${_koditarget}"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://codeload.github.com/xbmc/xbmc/tar.gz/refs/tags/${_kodiver}-${_koditarget}"
)
sha256sums=('6315a7bfe038b02c80efe4fe3ee33f92ee2454af8668ce3847e9bcaca38d2147'
            'a60afcb556e4a00cb19fc35b7e77758107c9a8096c6ce9b66af5f92396be31aa')

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    cmake \
	-Wno-dev \
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

