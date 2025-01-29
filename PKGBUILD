# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=21.1.3
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
sha256sums=('567b0d8bc7d79a166a65e3c47ecb3f73e3aa57db840465ea2e6c70c74421c162')

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
