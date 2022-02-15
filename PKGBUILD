# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=kronos
pkgname=$_pkgname-git
pkgver=r7017.c9e1548ef
pkgrel=1
pkgdesc='Sega Saturn emulator'
arch=('i686' 'x86_64' 'pentium4')
url='https://github.com/FCare/Kronos'
license=('GPL2')
provides=('kronos')
conflicts=('kronos')
depends=('freeglut'
	 'glew'
	 'openal'
         'qt5-base'
         'qt5-multimedia'
	 'sdl2')
makedepends=('cmake')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}/yabause"
    
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
    cd "${_pkgname}/yabause/build"
    make DESTDIR="$pkgdir/" install
}
