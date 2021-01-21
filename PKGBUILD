# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-freechaf-git
pkgver=72.b5cd0c9
pkgrel=1
pkgdesc="Fairchild ChannelF Libretro core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
_libname=freechaf_libretro
_gitname=FreeChaF
url="https://github.com/libretro/${_gitname}.git"
license=('GPL3')
groups=('libretro')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_gitname}"
    git submodule init
    git submodule update
    make
}

package() {
    install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
