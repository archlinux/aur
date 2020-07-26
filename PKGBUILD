# Maintainer Gleb Sinyavskiy <zhulik.gleb@gmail.com>
# Original author graysky <graysky AT archlinux DOT us>
#
pkgname=adguardhome-git
_origpkgname=adguardhome
_pkgname=AdGuardHome
pkgver=v0.103.3
pkgrel=1
pkgdesc="Network-wide ads and trackers blocking DNS server. Release version from git (fixed version string)"
arch=('x86_64')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL')
source=("AdGuardHome::git+https://github.com/AdguardTeam/AdGuardHome.git"
  "$_pkgname.service" sysusers.conf tmpfiles.conf
)
makedepends=(go npm git)
conflicts=(adguardhome)
install=readme.install
sha256sums=('SKIP'
            '3eb76cc878f544bfc276929096c1d7d233e2e3d613886ee9a78b306ac3cd763e'
            'e9a50b7004218803ecf44c0be8c7fb28d584e8b7b3a821f26ff3478816ab0afd'
            '7cacae3dad7042f331208a47f7177a27b03a45984659df900ac175d715883aad')

build(){
  cd "$_pkgname"
  git checkout tags/$pkgver
  make -j1
}

package() {
  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/var/lib/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir"/sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_origpkgname.conf"
  install -Dm644 "$srcdir"/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_origpkgname.conf"
}
