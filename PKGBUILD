# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

_pkgbase=libretro-bk
pkgname=libretro-bk-git
pkgver=r116.993bee8
pkgrel=1
pkgdesc="BK-0010/0011/Terak 8510a core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/bk-emulator"
license=('custom')
groups=('libretro')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
_libname=bk_libretro
source=("$_pkgbase::git+https://github.com/libretro/bk-emulator.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha512sums=('SKIP'
            'cf504d30f55069be4152d9e07c4c808655dc78a5de21a7f4621e06a4e9911347272943e6cb8ce98075ec75f8348fa98554646b09a2e7afd3e5751129d21a26c4')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgbase"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "$_pkgbase/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}

