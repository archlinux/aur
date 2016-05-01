pkgname=reaper
pkgver=5.20b10
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('GPL')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
source=("http://www.landoleet.org/dev/${pkgname}_520beta10_developer_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git")
md5sums=('9ef4051a370a49bb517818a30b156047' 'SKIP')

build() {
  cd "${srcdir}/WDL/WDL/swell"
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

