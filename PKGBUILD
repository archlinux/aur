pkgname=hdhomerun_config_gui
pkgver=20150406
pkgrel=1
pkgdesc="GTK2 GUI for configuring the HDHomeRun device"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('GPL3')
depends=('gtk2' "libhdhomerun=${pkgver}")
optdepends=('vlc: stream live channels directly from HDHomeRun'
            'mythtv: use HDHomeRun as PVR source')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha1sums=('3f97021379bc32455ea7b357371d6eafaec0209a')

build() {
  cd $srcdir/$pkgname

  # Thanks to James Edir <jimportal at gmail dot com> for contributing this fix
  # Updated for builds 20141210 and newer (mrc)
  sed -i "s|SUBDIRS = ../libhdhomerun src|SUBDIRS = src|g" Makefile.am
  sed -i "s|-I../../libhdhomerun|-I/usr/include/libhdhomerun|g" src/Makefile.am
  sed -i "s|-L../../libhdhomerun -lhdhomerun|-lhdhomerun|g" src/Makefile.am

  ./autogen.sh

  make
}

package() {
  install -D -m 755 $srcdir/$pkgname/src/hdhomerun_config_gui $pkgdir/usr/bin/hdhomerun_config_gui
}
