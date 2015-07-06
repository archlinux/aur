# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Maintainer:  aksr <aksr at t-com dot me>
pkgname=vwm
true && pkgname=('vwm' 'vwm-modules-sysmon' 'vwm-modules-vwmterm3')
pkgver=2.1.3
pkgrel=1
pkgdesc="Viper Window Manager"
arch=('i686' 'x86_64')
url="http://vwm.sourceforge.net/"
license=('GPL')
depends=('glibc>=2.8' 'libpseudo>=1.1.0' 'ncurses>=5.4' 'libviper>=1.4.5' 'gpm'
         'libgtop' 'libvterm-vwm')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2a5c1ecba9db9a6f85f3e3b358136179')
sha1sums=('3abef5b357a7f09eddffeefd9f5338a2d5de76e4')
sha256sums=('4e7545cf635247954cc08f4433a2cde8edb595a53dc2e8dae9de72ec3c8ebce4')

build() {
  cd "$srcdir/${pkgname%%-*}"
  sed -i 's/$(DEFS)/& ${includedir}/' modules/sysmon/Makefile
  make prefix=/usr
  make prefix=/usr -C modules/sysmon
  make prefix=/usr -C modules/vwmterm3
}

package_vwm() {
  cd "$srcdir/${pkgname%%-*}"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.h "$pkgdir/usr/include/$pkgname.h"
}

package_vwm-modules-sysmon() {
  true && depends=('vwm')
  true && pkgdesc="A system monitor module for vwm."

  install -Dm755 "$srcdir/${pkgname%%-*}/modules/sysmon/sysmon.so" \
    "$pkgdir/usr/lib/$pkgname/modules/sysmon.so"
}

package_vwm-modules-vwmterm3() {
  true && depends=('vwm')
  true && pkgdesc="A terminal shell module for vwm."

  install -Dm755 "$srcdir/${pkgname%%-*}/modules/vwmterm3/vwmterm3.so" \
    "$pkgdir/usr/lib/$pkgname/modules/vwmterm3.so"
}

