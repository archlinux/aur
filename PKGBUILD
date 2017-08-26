# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=libretro-fbalpha
_pkgname=fbalpha
pkgver=0.2.97.40
pkgrel=1
pkgdesc="A libretro implementation of Final Burn Alpha"
arch=('i686' 'x86_64')
url="https://github.com/libretro/fbalpha"
license=('Unknown')
depends=('libretro')
makedepends=('git')
source=("git+https://github.com/libretro/${_pkgname}.git"
        "fbalpha_libretro.info")
sha256sums=('SKIP'
            'f74c8f4b910b6d49fcf022ba86b65ea57dd7f9a1bcf991eb34e7ad7880c9eb18')

build() {
  cd "${_pkgname}"

  RPI=`grep -m 1 'Revision' /proc/cpuinfo | awk '{print $3}'`
  case "${RPI}" in
    a[0-2]1041)	PLATFORM="platform=rpi2" ;;
    a[0-2]2082)	PLATFORM="platform=rpi3" ;;
  esac

  make -f makefile.libretro ${PLATFORM}
}

package() {
  install -Dm 644 "${_pkgname}/fbalpha_libretro.so" \
    "${pkgdir}/usr/lib/libretro/$fbalpha_libretroso"
  install -Dm 644 "fbalpha_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/fbalpha_libretro.info"
}
