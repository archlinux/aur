# Maintainer: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=libretro-picodrive-git
pkgver=1208.25b12c1
pkgrel=1
pkgdesc="libretro implementation of PicoDrive (Sega MD/MS/GG/CD/32X)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
_libname=picodrive_libretro
_gitname=picodrive
url="https://github.com/libretro/${_gitname}"
license=('custom:Picodrive license')
groups=('libretro')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "${_gitname}"
    git submodule init
    git submodule update
}

build() {
    cd "${_gitname}"
    ./configure  
    make -f Makefile.libretro
}

package()
{
    install -Dm644 "${srcdir}/${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
    install -Dm644 "${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
