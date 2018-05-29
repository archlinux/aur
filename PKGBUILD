# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>
# Previous Maintainer of dehydrated: Alexander Görtz <aur@nyloc.de>

pkgname=dehydrated
pkgver=0.6.2
pkgrel=2
pkgdesc="A Let's Encrypt (ACME) client implemented in bash"
arch=(any)
url="https://github.com/lukas2511/dehydrated"
license=('MIT')
source=("https://github.com/lukas2511/dehydrated/archive/v$pkgver.tar.gz"
        "dehydrated.timer"
        "dehydrated.service"
)
depends=('curl' 'openssl')
optdepends=('letsencrypt-cloudflare-hook: Cloudflare hook for dns-01 challenge'
            'dehydrated-pdns-hook: PowerDNS api hook for dehydrated'
)
conflicts=('dehydrated-git')
sha256sums=('SKIP'
            'c2b5556776d20a2a8610e70d10eb2bf830ec5ac725be641ea0fe42945641d684'
            'fbc0d67e74a6c66b9a11f5fed7e623697871a74be5a65bf9a7aa436e89912cde'
)
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "dehydrated" "$pkgdir/usr/bin/dehydrated"
	install -Dm644 docs/examples/config "$pkgdir/etc/dehydrated/config.example"
	install -Dm644 docs/examples/domains.txt "$pkgdir/etc/dehydrated/domains.txt.example"
	install -Dm644 docs/examples/hook.sh "$pkgdir/etc/dehydrated/hook.sh.example"
	install -Dm644 docs/*.md -t "$pkgdir/usr/share/docs/dehydrated"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	install -Dm644 "$srcdir/dehydrated.timer" "$pkgdir/usr/lib/systemd/system/dehydrated.timer"
	install -Dm644 "$srcdir/dehydrated.service" "$pkgdir/usr/lib/systemd/system/dehydrated.service"
}
