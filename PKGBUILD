pkgname=reaper
pkgver=5.50rc2c
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
md5sums=('babd6c74f66ee872b717cc76a94b0ee5'
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

