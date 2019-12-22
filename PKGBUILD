# Maintainer graysky <graysky AT archlinux DOT us>
#
pkgname=adguardhome
_pkgname=AdGuardHome
pkgver=0.100.6
pkgrel=1
pkgdesc="Network-wide ads and trackers blocking DNS server"
arch=('x86_64')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/archive/v$pkgver.tar.gz"
$_pkgname.service
)
makedepends=('go' 'npm')
install=readme.install
sha256sums=('d00a0dbc5e61c3743a1e8cccee345e1668cf0c51f150204c98e07e815a683410'
            'a9b8ac4e94938b2ba24c8ac8e2d2d660ca2dbb472cc0c3d70f7cfdfa28649963')

build(){
  cd "$_pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$_pkgname-$pkgver/$_pkgname" "$pkgdir/opt/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
