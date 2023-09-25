pkgname=cytopia-git
_gitname=Cytopia
pkgver=r2820.eb692706
pkgrel=1
pkgdesc="A city building simulation game "
arch=('x86_64')
url="https://www.cytopia.net/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'libnoise' 'sdl2' 'libvorbis')
makedepends=('sdl2_image' 'sdl2_ttf' 'libnoise' 'sdl2' 'libvorbis' 'git' 'cmake')
source=('git+https://github.com/CytopiaTeam/Cytopia.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"

    cmake -G "Unix Makefiles" ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \

    cmake --build .
}

package() {
    cd "${srcdir}/${_gitname}"
    DESTDIR="$pkgdir" cmake --build . --target install
}
