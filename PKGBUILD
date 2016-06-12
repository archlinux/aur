# Contributor: Christopher Reimer <mail[at]creimer[dot]net>
pkgname=sundtek
pkgver=150728.175535
pkgrel=1
pkgdesc='Driver for Sundtek MediaTV Pro'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://www.sundtek.com'
license=('custom')
install="$pkgname.install"
optdepends=('lib32-gcc-libs: FM Radio' 'libpulse: FM Radio')
source=('sundtek.rules'
        'sundtek.service'
        'sundtek-restart.service')
source_x86_64=('installer_64bit.tar.gz::http://sundtek.de/media/netinst/64bit/installer.tar.gz?ARCH')
source_i686=('installer_32bit.tar.gz::http://sundtek.de/media/netinst/32bit/installer.tar.gz?ARCH')
source_armv6h=('installer_armsysvhf.tar.gz::http://sundtek.de/media/netinst/armsysvhf/installer.tar.gz?ARCH')
source_armv7h=('installer_armsysvhf.tar.gz::http://sundtek.de/media/netinst/armsysvhf/installer.tar.gz?ARCH')
sha256sums=('25d285416ca8b050fdd6fb21b70d448500e402767f87ce19a85520eb005da589'
            'c8c928d5ff8f1ee48ab2eb5c287c172e33c15b4a7d7ec7a0f993e701351c3f9d'
            '5192c1283b2c117188d265d29f360ff99baeb87bfb703961f9d6d6e692c800db')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
md5sums_armv6h=('SKIP')
md5sums_armv7h=('SKIP')

pkgver() {
  cd "$srcdir"

  # fix broken access rights
  chmod +r -R *

  strings opt/bin/mediasrv | egrep "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" -m1 | sed 's/[:-]//g;s/ /./g' | cut -b3-
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/opt/lib"
  cp -pr opt/bin "$pkgdir/opt/"
  cp -pr opt/lib/*.so "$pkgdir/opt/lib/"
  
  install -m644 -D "sundtek.rules" "$pkgdir/usr/lib/udev/rules.d/sundtek.rules"
  install -m644 -D "sundtek.service" "$pkgdir/usr/lib/systemd/system/sundtek.service"
  install -m644 -D "sundtek-restart.service" "$pkgdir/usr/lib/systemd/system/sundtek-restart.service"
  install -m644 -D "opt/doc/README" "$pkgdir/usr/share/licenses/sundtek/README"
}
