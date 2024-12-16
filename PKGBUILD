# Maintainer: Fleuria <fleuria at posteo dot co>
pkgname=uki-profilify
pkgver=0.1.3
pkgrel=1
pkgdesc="Multi-profile UKI creation helper"
arch=(any)
url="https://github.com/fleuriafluoride/uki-profilify"
license=('Apache-2.0')
groups=()
depends=('python' 'systemd-ukify>=257')
makedepends=('tar')
optdepends=('mkinitcpio: automatically create UKIs')
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c268d6ecd5fdb196bf5162da064bbf4bed63d7c78d102135f85c2be4a0b5732d')

package() {
	cd "$pkgname-$pkgver"
	gzip -c doc/$pkgname.1 > doc/$pkgname.1.gz

	install -D bin/uki-profilify.py $pkgdir/usr/bin/uki-profilify
	install -D mkinitcpio/invoke-uki-profilify.sh \
		$pkgdir/usr/lib/initcpio/post/invoke-uki-profilify.sh
	install -Dm644 doc/$pkgname.1.gz \
		$pkgdir/usr/share/man/man1/$pkgname.1.gz
}
