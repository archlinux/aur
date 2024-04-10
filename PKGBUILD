# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=21.0.0
pkgrel=1
pkgdesc='IPTV Stalker PVR client addon for Kodi'
_koditarget=Omega
_gitname=pvr.stalker
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz")
sha256sums=('a2cfe5e5acf186e368cd42bf811b217940685695be0e2689a299c80da7d217f4')

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    
    CFLAGS="$CFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"
    CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}
        
package() {
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    make DESTDIR="${pkgdir}" install
}
