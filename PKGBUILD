# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname="umtp-responder-gui"
pkgver="v0.5.0"
_shortname="umtprd"
_viv_pkgname="uMTP-Responder-umtprd"
_viv_pkgver="1.3.6"
pkgrel="1"
pkgdesc="GTK App to control the Viveris uMTP-Responder"
arch=('any')
url="https://gitlab.com/JollyDevelopment/umtp-responder-gui"
license=('GPLv3')
depends=('python>=3.0' 'gtk4' 'libadwaita')
source=(
	"https://github.com/viveris/uMTP-Responder/archive/refs/tags/umtprd-${_viv_pkgver}.tar.gz"
	"https://gitlab.com/JollyDevelopment/umtp-responder-gui/-/archive/${pkgver}/umtp-responder-gui-${pkgver}.tar.gz"
)
md5sums=(
	"26bddcafca129b656fb81b100035a9c1"
	"ecf9d137a1e337a7b951322d59f7f10e"
)
build(){
  cd $srcdir/$_viv_pkgname-$_viv_pkgver
  make
}
package(){
  install=umtp-responder-gui.install
  cd $srcdir/$_viv_pkgname-$_viv_pkgver
  install -Dm755 $_shortname -t $pkgdir/usr/bin
  cd ../../
  cd $srcdir/$pkgname-$pkgver/
  install -Dm644 assets/umtprd.conf -t $pkgdir/etc/umtprd
  install -Dm755 assets/alarm-usb-gadget -t $pkgdir/usr/bin
  install -Dm755 assets/umtp-responder-control -t $pkgdir/usr/bin
  install -Dm644 assets/umtp-responder.service -t $pkgdir/usr/lib/systemd/system
  install -Dm644 assets/alarm-usb-gadget.service -t $pkgdir/usr/lib/systemd/system
  install -Dm644 assets/override.conf -t $pkgdir/usr/lib/systemd/system/umtp-responder.service.d
  install -Dm644 assets/net.jollydevelopment.umtp-responder-gui.desktop -t $pkgdir/usr/share/applications
  install -Dm644 assets/net.jollydevelopment.umtp-responder-gui.policy -t $pkgdir/usr/share/polkit-1/actions
  install -Dm755 app/umtp-responder-gui -t $pkgdir/opt/umtp-responder-gui
  cp -r app/ui $pkgdir/opt/umtp-responder-gui
}
