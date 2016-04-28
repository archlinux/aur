# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=letsencrypt.sh-git
pkgver=v0.1.0.r24.ga7c6af6
pkgrel=1
pkgdesc="A Let's Encrypt (ACME) client implemented in bash"
arch=(any)
url="https://github.com/lukas2511/letsencrypt.sh"
license=('MIT')
source=("$pkgname::git+https://github.com/lukas2511/letsencrypt.sh.git"
        "letsencrypt.sh.timer" "letsencrypt.sh.service")
depends=('curl' 'openssl')
makedepends=('git')
sha256sums=('SKIP'
            'c2b5556776d20a2a8610e70d10eb2bf830ec5ac725be641ea0fe42945641d684'
            '2fa8367f86a173a262c46804849fbeaf0180a36d6cad83e6927f7d245e8c9f77')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	install -Dm755 letsencrypt.sh "$pkgdir/usr/bin/letsencrypt.sh"

	install -Dm644 "$srcdir/letsencrypt.sh.timer" "$pkgdir/usr/lib/systemd/system/letsencrypt.sh.timer"
	install -Dm644 "$srcdir/letsencrypt.sh.service" "$pkgdir/usr/lib/systemd/system/letsencrypt.sh.service"

	install -Dm644 docs/*.md -t "$pkgdir/usr/share/docs/letsencrypt.sh"

	install -Dm644 docs/examples/config.sh.example "$pkgdir/etc/letsencrypt.sh/config.sh.example"
	install -Dm644 docs/examples/domains.txt.example "$pkgdir/etc/letsencrypt.sh/domains.txt.example"
	install -Dm644 docs/examples/hook.sh.example "$pkgdir/etc/letsencrypt.sh/hook.sh.example"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
