# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-pocketcdg-git
_gitname=libretro-pocketcdg
pkgver=r109.c1fac9f
pkgrel=1
pkgdesc="libretro port of pocketcdg, karaoke player"
arch=('x86_64')
url="https://github.com/libretro/libretro-pocketcdg"
license=('MIT')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make platform="unix"
}

package() {
  cd "${_gitname}"
  install -Dm644 "pocketcdg_libretro.so" "${pkgdir}/usr/lib/libretro/pocketcdg_libretro.so"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
