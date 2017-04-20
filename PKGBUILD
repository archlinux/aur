pkgname=reaper
pkgver=5.404
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('custom')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
makedepends=('git' 'gcc' 'make' 'lsb-release')
source=("http://www.landoleet.org/dev/${pkgname}_${pkgver//.}_developer_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git")
md5sums=('32e23f358a60544532435130abd2eed9'
         'SKIP')

build() {
  cd "${srcdir}/WDL/WDL/swell"
  make
}

package() {
  DESTDIR="${pkgdir}/usr/lib/"
  LICENSEDIR="${pkgdir}/usr/share/licenses/reaper/"
  mkdir -p "${DESTDIR}"
  cp -R "${srcdir}/reaper_linux_x86_64/REAPER/" "${DESTDIR}"
  cp "${srcdir}/WDL/WDL/swell/libSwell.so" "${DESTDIR}/REAPER"
  mkdir ${pkgdir}/usr/bin
  ln -s /usr/lib/REAPER/reaper5 ${pkgdir}/usr/bin/reaper5
  mkdir -p "${LICENSEDIR}"
  cp "${srcdir}/reaper_linux_x86_64/REAPER/license.txt" "${LICENSEDIR}/LICENSE"
}

