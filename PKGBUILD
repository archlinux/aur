# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=ems-flasher-git
pkgver=r44.74ae174
pkgrel=1
pkgdesc='Utility to flash ROM images to the EMS USB 64 mbit gameboy flash cart on Linux'
url="http://lacklustre.net/gb/ems/"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=('git')
depends=('libusb')
conflicts=('ems-flasher')
provides=('ems-flasher')
source=("git://lacklustre.net/ems-flasher"
        '50_ems_gb_flash.rules')
md5sums=('SKIP'
         '1aaaea2bd61c97a9820842fa1aefa05d')

pkgver() {
  cd ems-flasher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/ems-flasher
  make
  gzip ems-flasher.1
}

package() {
  cd "$srcdir"
  install -Dm755 ems-flasher/ems-flasher "${pkgdir}/usr/bin/ems-flasher"
  install -Dm644 ems-flasher/ems-flasher.1.gz "${pkgdir}/usr/share/man/man1/ems-flasher.1.gz"
  install -Dm644 50_ems_gb_flash.rules "${pkgdir}/etc/udev/rules.d/50_ems_gb_flash.rules"
}
