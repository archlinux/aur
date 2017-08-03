pkgname=reaper
pkgver=5.
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('custom')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
makedepends=('git' 'gcc' 'make' 'lsb-release')
source=("http://www.landoleet.org/dev/${pkgname}_${pkgver//.}_developer_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git"
	"Reaper.desktop")
md5sums=('23e5ce9207e0e48f2a86f7e2630d9c3c'
         'SKIP'
         '1cb4c919a67431bd75c39e428959919c')

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
  mkdir "${pkgdir}/usr/bin"
  ln -s /usr/lib/REAPER/reaper5 "${pkgdir}/usr/bin/reaper5"

  install -D -m644 "${srcdir}/Reaper.desktop" "${pkgdir}/usr/share/applications/Reaper.desktop"
  install -D -m644 "${srcdir}/reaper_linux_x86_64/REAPER/license.txt" "${LICENSEDIR}/LICENSE"
}

