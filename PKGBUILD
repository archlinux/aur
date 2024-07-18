# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=retroarch-standalone-service
pkgver=3
pkgrel=1
pkgdesc="Systemd service and user to run Retroarch in stand-alone mode"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('retroarch' 'retroarch-assets-xmb' 'xorg-server' 'xorg-xinit' 'xorg-xset' 'unclutter')
install='retroarch-standalone.install'
source=(
  'retroarch-standalone.service'
  'retroarch-standalone.sysuser'
  'retroarch-standalone.cfg'
  'retroarch-standalone.xinitrc'
)
sha256sums=('5efc1dcc2d220a33f0d53d6abe4538227f434ff2a00f5165bb209cf6e0bae4a3'
            '48d9f35b943209764990050a06dea9bd356aa275adccb3e0a835e738e6beb0c6'
            'dfea842678f3d5b7f203246c87b20f94dbc5de5fadc4af2308d0c795bed68001'
            '72f004ed449fdf3949ed78cd8031dcc3d35630bf5897d760f159fa62cd0782ef')

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
