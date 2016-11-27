pkgname=reaper
pkgver=5.29
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('GPL')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
source=("http://www.landoleet.org/dev/${pkgname}_520rc3_developer_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git")
md5sums=('05445b30c89709cfebf857a10305e979'
         'SKIP')
build() {
  cd "${srcdir}/WDL/WDL/swell"
#  sed -i 's#/usr/share/fonts/truetype/msttcorefonts#/usr/share/fonts/TTF#' "${srcdir}/WDL/WDL/swell/swell-gdi-lice.cpp"
  make
}

package() {
  DESTDIR="${pkgdir}/usr/lib/"
  mkdir -p $DESTDIR
  cp -R "${srcdir}/reaper_linux_x86_64/REAPER/" $DESTDIR
  cp "${srcdir}/WDL/WDL/swell/libSwell.so" $DESTDIR/REAPER
  mkdir ${pkgdir}/usr/bin
  ln -s /usr/lib/REAPER/reaper5 ${pkgdir}/usr/bin/reaper5
}

