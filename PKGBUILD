# Maintainer: James Duley <jagduley gmail>

pkgname=librepilot
_upstreamname=LibrePilot
pkgver=15.09
pkgrel=1
pkgdesc="A ground control station and firmware for UAV flight controllers"
arch=('i686' 'x86_64')
url="http://www.librepilot.org"
license=('GPL')
depends=('qt5-svg' 'qt5-serialport' 'qt5-multimedia' 'qt5-quickcontrols' 'sdl' 'libusb')
makedepends=('python2' 'qt5-tools' 'qt5-quick1')
conflicts=('librepilot-git')
replaces=('openpilot')
source=("http://download.librepilot.org/source/${_upstreamname}-${pkgver//_/-}.tar.gz"
        "http://download.librepilot.org/firmware/${_upstreamname}-${pkgver//_/-}_firmware.tar.gz")
md5sums=('2fd8aa64218cd3bbb3adbb3233f86618'
         'baf4e96ae060c93ca9c057ee6ff0c835')

build() {
  cd "$srcdir/$_upstreamname"
  make \
  prefix=/usr \
  udevrulesdir=/usr/lib/udev/rules.d \
  WITH_PREBUILT_FW="$srcdir/firmware" \
  config_new 

  make opfw_resource gcs
}

package() {
  cd "$srcdir/$_upstreamname/"
  make DESTDIR=$pkgdir enable-udev-rules=yes install
}
