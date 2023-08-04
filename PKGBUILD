# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-iptvsimple
pkgver=20.11.0
pkgrel=3
pkgdesc='IPTV Simple PVR client addon for Kodi'
_koditarget=Nexus
_gitname=pvr.iptvsimple
_kodiver=20.2
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform' 'kodi-dev' 'pugixml')
conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz")
sha256sums=('c2014b11dd928a1d4789279d7f3ce25af8af4047194e8406f9dfd99d16fe2ee2')

#prepare() {
    #cd xbmc-${_kodiver}-${_koditarget}
    #patch -p1 cmake/scripts/common/HandleDepends.cmake ${srcdir}/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff
    #sed -i "s|-p1 -i|--binary -p1 -i|" cmake/scripts/common/HandleDepends.cmake
    #sed -i 's/GIT_SHALLOW 1/GIT_SHALLOW ""/g' cmake/scripts/common/HandleDepends.cmake
#}

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
