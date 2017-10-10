# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname=hciattach-rpi3
pkgver=5.38
pkgrel=1
url="http://www.bluez.org/"
arch=('armv6h' 'armv7h')
license=('GPL2')
makedepends=('dbus' 'libical' 'systemd')
source=(http://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz
        0001-sleep-before-reset.patch)
sha256sums=('0618c5440be6715805060ab5eea930526f34089c437bf61819447b160254f4df'
            '788472529eec5e5d5e5db95727c072bde868a509f4092171d35b7bf78bf81390')

prepare() {
  cd "bluez-${pkgver}"

  patch -Np1 -i ../0001-sleep-before-reset.patch
}

build() {
  cd "bluez-${pkgver}"

  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --enable-sixaxis \
          --enable-experimental \
          --enable-library # this is deprecated

  make tools/hciattach
}

package() {
  cd "bluez-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mv tools/hciattach "${pkgdir}/usr/bin/hciattach-rpi3" 
}

