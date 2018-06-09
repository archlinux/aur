# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun_config_gui
pkgver=20180327
pkgrel=1
pkgdesc="GUI for configuring a HDHomeRun device"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('GPL3')
depends=('gtk3' "libhdhomerun")
optdepends=('vlc: stream live channels directly from HDHomeRun'
            'mythtv: use HDHomeRun as PVR source'
            'hdhomerun-firmware-bin: firmware files for hdhomerun devices')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha256sums=('212ccc853a6a80bc2cbb956dca56c73b0cb60089e1c930b3add8eca26b48529b')

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
