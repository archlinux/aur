pkgname=reaper
pkgver=5.34
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('custom')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
makedepends=('git' 'gcc' 'make')
source=("http://www.landoleet.org/dev/${pkgname}_534_developer_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git")
md5sums=('5c95e410d3c4b2f55c129fbf0cf3367c'
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

