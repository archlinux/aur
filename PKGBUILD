# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

_pkgname=kronos
pkgname=$_pkgname-git
pkgver=r7017.c9e1548ef
pkgrel=2
pkgdesc='Sega Saturn emulator'
arch=('i686' 'x86_64' 'pentium4')
url="fcare.github.io"
_repo='https://github.com/FCare/Kronos'
license=('GPL2')
provides=('kronos')
conflicts=('kronos')
depends=('freeglut'
	 'glew'
	 'openal'
         'qt5-base'
         'qt5-multimedia'
	 'sdl2')
makedepends=('cmake'
	     'clang')
source=("${_pkgname}::git+${_repo}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}/yabause"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build
}

build() {
    cd "${_pkgname}/yabause/build"
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DYAB_USE_QT5=ON
    make
}

package() {
    cd "${_pkgname}/yabause/build"
    make DESTDIR="$pkgdir/" install
}
