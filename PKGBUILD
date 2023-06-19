# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=kronos
_pkg=Kronos
pkgname=$_pkgname
pkgver=2.5.0
_pkgver="${pkgver}_official_release"
pkgrel=1
pkgdesc='Sega Saturn emulator'
arch=('i686' 'x86_64' 'pentium4')
url='https://github.com/FCare/Kronos'
license=('GPL2')
provides=('kronos')
depends=('freeglut'
	 'glew'
	 'openal'
         'qt5-base'
         'qt5-multimedia'
	 'sdl2')
makedepends=('cmake')
source=(
  # "${_pkgname}-${pkgver}::git+${url}#tag=${_pkgver}"
  "${url}/archive/refs/tags/${_pkgver}.tar.gz"
)
b2sums=('108bd21f6f786d35d066f7bfe9f69118bac40870a3a81d2d0cbccd7cb30792f7401a3087ac9fa770bb4e0aa09be7e221c03b72e909cf0e06729185bc0aab20ea')

build() {
    cd "${_pkg}-${_pkgver}/yabause"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DYAB_USE_QT=ON
    make
}

package() {
    cd "${_pkg}-${_pkgver}/yabause/build"
    make DESTDIR="$pkgdir/" install
}
