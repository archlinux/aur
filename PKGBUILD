# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=nft-blacklist-git
pkgver=v2.0.r3.9dcd5c7
pkgrel=1
pkgdesc="Blacklist country specific IP blocks using nftables"
arch=("any")
url="https://github.com/rpthms/nft-blacklist"
license=("custom") # MIT
depends=("nftables" "python")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/conf.d/nft-blacklist")
source=("git+$url.git"
        "nft-blacklist.conf"
        "nft-blacklist.service"
        "nft-blacklist.timer")
md5sums=('SKIP'
         'ec4f4ff03f01671e52edd98ca6fbae9f'
         '3d02eed6f5453e6c5693f7f9a4f503da'
         '34be430faae329975393a9dcd34dea6c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm755 "nft-blacklist.py" "$pkgdir/usr/bin/nft-blacklist"
  install -Dm644 "../nft-blacklist.service" "$pkgdir/usr/lib/systemd/system/nft-blacklist.service"
  install -Dm644 "../nft-blacklist.timer" "$pkgdir/usr/lib/systemd/system/nft-blacklist.timer"
  install -Dm644 "../nft-blacklist.conf" "$pkgdir/etc/conf.d/nft-blacklist"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
