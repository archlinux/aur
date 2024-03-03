# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='auto-suspend'
pkgver='0.8.1'
pkgrel='1'
pkgdesc='A simple but handy system monitor in pure bash'
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL-3.0-or-later')
# namcap warn nothing of these are needed, only bash is fine
depends=('bash' 'iputils' 'grep' 'procps-ng' 'findutils')
# optdepends=() # No systemd or samba, there is no benefit to install explicit
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('81d52fc9822c508a6442d7cafe483bea8e4e4140bb491e51aa09023ba9a89f42')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "auto-suspend" "${pkgdir}/usr/bin/auto-suspend"
  install -Dm644 "auto-suspend.conf" "${pkgdir}/etc/auto-suspend.conf"
  install -Dm644 "auto-suspend-daemon.service" "${pkgdir}/usr/lib/systemd/system/auto-suspend-daemon.service"
  install -Dm644 "auto-suspend-clerk.service" "${pkgdir}/usr/lib/systemd/system/auto-suspend-clerk.service"
  install -Dm644 "auto-suspend-clerk.timer" "${pkgdir}/usr/lib/systemd/system/auto-suspend-clerk.timer"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
