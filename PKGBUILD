# Maintainer: Christopher Reimer <mail[at]creimer[dot]net>
pkgname=sundtek
pkgver=141229.102705
pkgrel=1
pkgdesc='Driver for Sundtek MediaTV Pro'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.sundtek.com'
license=('custom')
install="$pkgname.install"
depends=('lib32-gcc-libs' 'libpulse')
source_x86_64=('installer_64bit.tar.gz::http://sundtek.de/media/netinst/64bit/installer.tar.gz?ARCH')
source_i686=('installer_32bit.tar.gz::http://sundtek.de/media/netinst/32bit/installer.tar.gz?ARCH')
source_armv6h=('installer_armsysvhf.tar.gz::http://sundtek.de/media/netinst/armsysvhf/installer.tar.gz?ARCH')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
md5sums_armv6h=('SKIP')

pkgver() {
  cd "$srcdir/opt/bin"
  _date=$(./mediasrv --build 2>&1 | cut -d' ' -f3 | cut -b3- | tr -d -)
  _time=$(./mediasrv --build 2>&1 | cut -d' ' -f4 | tr -d :)
  echo -n $_date.$_time
}

package() {
  cd "$srcdir"

  # fix broken access rights
#   chmod +r -R *

  mkdir -p "$pkgdir/opt/lib"
  cp -pr opt/bin "$pkgdir/opt/"
  cp -pr opt/lib/*.so "$pkgdir/opt/lib/"
  
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  cp etc/udev/rules.d/* "$pkgdir/usr/lib/udev/rules.d"
  install -D opt/doc/sundtek.service "$pkgdir/usr/lib/systemd/system/sundtek.service"
  install -D "opt/doc/README" "$pkgdir/usr/share/licenses/sundtek/README"
}
