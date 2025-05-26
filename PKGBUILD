# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun_config_gui
pkgver=20250506
pkgrel=1
pkgdesc="GUI for configuring a HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.silicondust.com/downloads"
license=('GPL3')
depends=('gtk2' "libhdhomerun")
optdepends=('vlc: stream live channels directly from HDHomeRun'
            'mythtv: use HDHomeRun as PVR source'
            'hdhomerun-firmware-bin: firmware files for hdhomerun devices')
source=("https://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha512sums=('e0b1294d33d925bfef0015df4b746c88b47dde1118912ff40ff01891fc766e8732daa2eebb66479ab5995174934f1e15fbad8f97f5f4a8e7b7766af3c01ebf09')

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
