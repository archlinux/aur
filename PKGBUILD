# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun_config_gui
pkgver=20200521
pkgrel=1
pkgdesc="GUI for configuring a HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.silicondust.com/downloads"
license=('GPL3')
depends=('gtk2' "libhdhomerun")
optdepends=('vlc: stream live channels directly from HDHomeRun'
            'mythtv: use HDHomeRun as PVR source'
            'hdhomerun-firmware-bin: firmware files for hdhomerun devices')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha512sums=('8b0a6aa4fc48b0d1df8c049b4636d628e571e14c59cdb235f716c50dbc2ed75a78b7748dde7a8ebf2a28489b015bf2cc557431169ad4398a79ea3747939dac19')

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
