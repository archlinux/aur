# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=libretro-fbalpha
_pkgname=fbalpha
pkgver=0.2.97.40
pkgrel=1
pkgdesc="A libretro implementation of Final Burn Alpha"
arch=('i686' 'x86_64')
url="https://github.com/libretro/fbalpha"
license=('GPL2')
depends=()  # retroarch isn't required, but I probably missed something here
source=("https://github.com/libretro/${_pkgname}/archive/v${pkgver}.tar.gz"
        "fbalpha_libretro.info")
md5sums=('a29427fb8853fe562d535b7725e663fc'
         '0f390deb382dd241034d48be2f5e9e29')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  RPI=`grep -m 1 'Revision' /proc/cpuinfo | awk '{print $3}'`
  case "${RPI}" in
    a[0-2]1041)	PLATFORM="platform=rpi2" ;;
    a[0-2]2082)	PLATFORM="platform=rpi3" ;;
  esac

  make -f makefile.libretro ${PLATFORM}
}

package() {
  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/fbalpha_libretro.so" \
    "${pkgdir}/usr/lib/libretro/fbalpha_libretro.so"
  install -Dm 644 "${srcdir}/fbalpha_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/fbalpha_libretro.info"
}
