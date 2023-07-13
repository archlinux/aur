pkgname=cytopia-git
_gitname=Cytopia
pkgver=0b286259
pkgrel=1
pkgdesc="A city building simulation game "
arch=('x86_64')
url="https://www.cytopia.net/"
license=('GPL3')
makedepends=('sdl2_image' 'sdl2_ttf' 'libnoise' 'sdl2' 'libvorbis' 'gcc' 'git' 'cmake')
source=('git+https://github.com/CytopiaTeam/Cytopia.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's/-/./g'
}

build() {
    cd ${_gitname}
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd ${srcdir}/${_gitname}
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}
