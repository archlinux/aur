# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor : Mike Polvere <mic.tjs@gmail.com>
# Contributor : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor : Lauri Niskanen <ape@ape3000.com>

pkgname=libretro-gambatte-git
pkgver=889.d8ccae4
pkgrel=1
pkgdesc="Nintendo Game Boy/Game Boy Color core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/gambatte-libretro"
license=('GPL2')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=gambatte_libretro
_gitname=gambatte-libretro

source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
    install -Dm644 "${srcdir}/${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
