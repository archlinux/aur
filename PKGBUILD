# Maintainer: jadelclemens <jadelclemens at gmail dot com>
pkgname=crowdsec-cloudflare-bouncer
pkgver=0.3.0.rc2
_pkgver_internal=0.3.0-rc2
pkgrel=3
pkgdesc="CrowdSec bouncer for Cloudflare"
arch=('x86_64')
url="https://doc.crowdsec.net/docs/bouncers/cloudflare"
_giturl="https://github.com/crowdsecurity/cs-cloudflare-bouncer"
license=('MIT')
provides=('cs-cloudflare-bouncer')
conflicts=('cs-cloudflare-bouncer')
depends=(
  'crowdsec'
)
makedepends=(
  'gettext'
)
backup=(
  etc/crowdsec/bouncers/crowdsec-cloudflare-bouncer.yaml
)
install=cs-cloudflare-bouncer.install
source=(
  "$pkgname-$pkgver.tar.gz::${_giturl}/releases/download/v${_pkgver_internal}/${pkgname}.tgz"
)
sha256sums=('02c474b71ec9ee7c9f55e63942db497f9b48a895b8a4f5c495ff65135014a11f')

package() {
  cd "$pkgname-v$_pkgver_internal"
  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/lib/systemd/system/
  install -dm755 $pkgdir/etc/crowdsec/bouncers/

  _srcpkgdir="${pkgname}-v${_pkgver_internal}"

  install -Dm755 $srcdir/$_srcpkgdir/crowdsec-cloudflare-bouncer -t $pkgdir/usr/bin/
  install -Dm600 $srcdir/$_srcpkgdir/config/crowdsec-cloudflare-bouncer.yaml -t $pkgdir/etc/crowdsec/bouncers/
  install -Dm644 $srcdir/$_srcpkgdir/config/crowdsec-cloudflare-bouncer.service -t $pkgdir/usr/lib/systemd/system/
}
