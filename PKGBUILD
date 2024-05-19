# Maintainer: HaoCheng <ch1994@outlook.com>
_pkgname=unblockneteasemusic
pkgname=$_pkgname-bin
pkgver=0.27.7
pkgrel=1
pkgdesc="Revive unavailable songs for Netease Cloud Music"
provides=($_pkgname)
arch=("x86_64" "aarch64")
url=https://github.com/UnblockNeteaseMusic/server
license=(MIT)
options=("!strip")
backup=(etc/unblockneteasemusic/args.conf)
provides=("unblockneteasemusic")
conflicts=(
	"nodejs-unblockneteasemusic"
	"netease-cloud-music-unblock-enhanced-git"
)
source=(
	$_pkgname.service
	$_pkgname.sysusers
	args.conf
	LICENSE::https://raw.githubusercontent.com/UnblockNeteaseMusic/server/enhanced/COPYING
)
source_x86_64=(
	"$_pkgname-x86_64::$url/releases/download/v${pkgver//_/-}/$_pkgname-linux-x64"
	)
source_aarch64=(
	"$_pkgname-aarch64::$url/releases/download/v${pkgver//_/-}/$_pkgname-linux-arm64"
	)
sha256sums=('a10419b2f0618e664c1663851b2cd627c4da7026287718619706d723d968ec72'
            '59dc25365cc6ea9e0f0e4e2b66b8b079eb74d542c5548c1c1b2722aef2f94270'
            '855d3b27684803b726a3415732d9cc1788f1baa835d8016017b390c711b4624f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('ad5801d20c1f9a14b06fa672a330a7ad2e07b4340a4f13ab8bac6a43d3b544d7')
sha256sums_aarch64=('5770beaf9a3b990a71b286c4e821ba449f7f3e7fa293ec8c6802d54043098c20')

package() {
	install -Dm755 "$srcdir/$_pkgname-$CARCH" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "$srcdir/args.conf" "$pkgdir/etc/unblockneteasemusic/args.conf"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
