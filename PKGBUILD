# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=retroarch-standalone-service
pkgver=2
pkgrel=12
pkgdesc="Systemd service and user to run Retroarch in stand-alone mode"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('retroarch' 'retroarch-assets-xmb' 'xorg-server' 'xorg-xinit' 'xorg-xset' 'unclutter')
install='retroarch-standalone.install'
source=(
  'retroarch-standalone.service'
  'retroarch-standalone.sysuser'
  'retroarch-standalone.cfg'
  'retroarch-standalone.xinitrc'
)
sha256sums=(
  '5efc1dcc2d220a33f0d53d6abe4538227f434ff2a00f5165bb209cf6e0bae4a3'
  '5e757f5279e349a6d0b775a493ab845a7cabdd7d68c946dffdf02868fc3806b2'
  '4c56ad43f3a5f209b4f3fb433b9ce4e0573b032cee21e587f912d6bc1d851423'
  '4eb68b4b61e812d7047cf52ebd14c590637bb2b0594b13a288134a827a8429c1'
)

package() {
  # Copy autorun script
  install -Dm644 ${srcdir}/retroarch-standalone.xinitrc "$pkgdir/home/retroarch/.xinitrc"

  # Copy additional configuration file to /etc
  install -Dm644 ${srcdir}/retroarch-standalone.cfg "$pkgdir/etc/retroarch-standalone.cfg"

  #Install service file
  install -Dm644 ${srcdir}/retroarch-standalone.service "$pkgdir/usr/lib/systemd/system/retroarch-standalone.service"

  #Install sysuser config
  install -Dm644 ${srcdir}/retroarch-standalone.sysuser "$pkgdir/usr/lib/sysusers.d/retroarch-standalone.conf"
}
