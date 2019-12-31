# Maintainer graysky <graysky AT archlinux DOT us>
#
pkgname=adguardhome
_pkgname=AdGuardHome
pkgver=0.100.8
pkgrel=1
pkgdesc="Network-wide ads and trackers blocking DNS server"
arch=('x86_64')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/archive/v$pkgver.tar.gz"
$_pkgname.service
)
makedepends=(go npm git)
install=readme.install
sha256sums=('25ca844370fd9d8973757702e55ec293958033a12f96a3a0bdf1f41438f38b27'
            '9f47d9b2d7daad4b4db08d7cf8c10a7fb55323f40e06161a56e6fcf109f890cd')

build(){
  cd "$_pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$_pkgname-$pkgver/$_pkgname" "$pkgdir/var/lib/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
