# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=19.0.3
pkgrel=1
pkgdesc='IPTV Stalker PVR client addon for Kodi'
_koditarget=Matrix
_gitname=pvr.stalker
_kodiver=19.4
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform' 'git')
depends=('kodi')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('c0d71dad5fdbc334ea8b0b66f5155c72b6f59a76c268a1de71edb837688ebf81'
            'cc026f59fd6e37ae90f3449df50810f1cefa37da9444e1188302d910518710da'
            )

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
