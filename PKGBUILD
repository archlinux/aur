# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>
pkgname=wireguard-ui-bin
_pkgname=wireguard-ui
pkgver=0.5.2
pkgrel=1
pkgdesc="A web user interface to manage your WireGuard setup."
arch=('x86_64')
url="https://github.com/ngoduykhanh/wireguard-ui"
license=('MIT')
provides=('wireguard-ui')
conflicts=('wireguard-ui')
depends=('wireguard-tools')
install=$_pkgname.install

source=(https://github.com/ngoduykhanh/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz
		$_pkgname.service
		99-wg.conf
		wgiptables.sh
		wg-reload.path
		wg-reload.service)
md5sums=('aa38b4b0950e9df0dcf3ddba87516f0a'
         '9632dcff1438fdd29befaf0f4db1873c'
         '70c4fc283f2195096c491f7be65d6342'
         '1fe01c771e1faabcaca6a24c09f299ae'
         '9efcd8b52477051ac3297b295e3a777e'
         '66b402a7b0ac73787f744931302f3dac')
package() {
  install -d $pkgdir/{opt/$_pkgname,usr/lib/systemd/system,etc/sysctl.d}
  install -Dm755 $_pkgname $pkgdir/opt/$_pkgname/$_pkgname
  install -Dm644 $srcdir/$_pkgname.service ${pkgdir}/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 $srcdir/99-wg.conf ${pkgdir}/etc/sysctl.d/99-wg.conf
  install -Dm755 $srcdir/wgiptables.sh ${pkgdir}/opt/$_pkgname/wgiptables
  install -Dm644 $srcdir/wg-reload.path ${pkgdir}/usr/lib/systemd/system/wg-reload.path
  install -Dm644 $srcdir/wg-reload.service ${pkgdir}/usr/lib/systemd/system/wg-reload.service
}
