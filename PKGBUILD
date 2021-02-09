# Maintainer: 4censord <mail@business-insulting.de>
pkgver=7.20.0.8.2.0
pkgrel=1
_filenameversion="7.20.0-8.2.0"

pkgbase=xe-guest-utilities-xcp-ng
pkgname=('xe-guest-utilities-xcp-ng' 'xenstore-xcp-ng')
pkgdesc="XenServer Tools, XCP-NG fork version"

url="https://github.com/xcp-ng/xe-guest-utilities"
license=('BSD')

arch=('x86_64')
depends=('lsb-release')
makedepends=('go-pie')
conflicts=('xe-guest-utilities')
source=(https://github.com/xcp-ng/xe-guest-utilities/archive/v$_filenameversion.tar.gz 'xe-linux-distribution.service' )
sha256sums=('5b38f0bd94b51d6312a306ce9cd4944c22ddbeebd11d5c057ae5d37a528a1b79' 'a5f725a26140fb4e2d3ec60c32be78ab224a6cc1f7f176fafa65529175b7d731')

build() {
  cd $srcdir/xe-guest-utilities-$_filenameversion
  make
}

package_xenstore-xcp-ng() {
  conflicts=('xenstore')
  install -Dm444 $srcdir/xe-guest-utilities-$_filenameversion/LICENSE   $pkgdir/usr/share/licenses/xenstore-xcp-ng/LICENSE

  install -Dm544 $srcdir/xe-guest-utilities-$_filenameversion/build/stage/usr/bin/xenstore $pkgdir/usr/bin/xenstore
  
  cd $pkgdir
  ln -s /usr/bin/xenstore usr/bin/xenstore-chmod
  ln -s /usr/bin/xenstore usr/bin/xenstore-exists 
  ln -s /usr/bin/xenstore usr/bin/xenstore-list
  ln -s /usr/bin/xenstore usr/bin/xenstore-ls
  ln -s /usr/bin/xenstore usr/bin/xenstore-read   
  ln -s /usr/bin/xenstore usr/bin/xenstore-rm     
  ln -s /usr/bin/xenstore usr/bin/xenstore-watch
  ln -s /usr/bin/xenstore usr/bin/xenstore-write  
}


package_xe-guest-utilities-xcp-ng() {
  conflicts=('xe-guest-utilities')
  depends=('xenstore-xcp-ng' 'bash')
  install -Dm444 $srcdir/xe-guest-utilities-$_filenameversion/LICENSE   $pkgdir/usr/share/licenses/xe-guest-utilities-xcp-ng/LICENSE

  install -Dm544 $srcdir/xe-guest-utilities-$_filenameversion/build/stage/usr/sbin/xe-daemon $pkgdir/usr/bin/xe-daemon
  install -Dm544 $srcdir/xe-guest-utilities-$_filenameversion/build/stage/usr/sbin/xe-linux-distribution $pkgdir/usr/bin/xe-linux-distribution
  install -Dm644 $srcdir/xe-guest-utilities-$_filenameversion/build/stage/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules $pkgdir/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules
  install -Dm644 $srcdir/xe-linux-distribution.service $pkgdir/usr/lib/systemd/system/xe-linux-distribution.service
}