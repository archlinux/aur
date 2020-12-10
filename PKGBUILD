# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Alexander Görtz <aur@nyloc.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=dehydrated-git
_pkgname=dehydrated
pkgver=0.7.0.r1.g3a77955
pkgrel=1
pkgdesc="A Let's Encrypt (ACME) client implemented as a shell script"
arch=(any)
url="https://github.com/lukas2511/dehydrated"
license=('MIT')
source=("$_pkgname::git+https://github.com/lukas2511/dehydrated.git"
        "dehydrated.timer" "dehydrated.service")
depends=('curl' 'openssl')
makedepends=('git')
sha256sums=('SKIP'
            'c2b5556776d20a2a8610e70d10eb2bf830ec5ac725be641ea0fe42945641d684'
            '9721a64b90cd23971755fdb49bdea84068e8b6cc21ed913d141a0af7edda8b2f')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	install -Dm755 dehydrated "$pkgdir/usr/bin/dehydrated"

	install -Dm644 "$srcdir/dehydrated.timer" "$pkgdir/usr/lib/systemd/system/dehydrated.timer"
	install -Dm644 "$srcdir/dehydrated.service" "$pkgdir/usr/lib/systemd/system/dehydrated.service"

	install -Dm644 docs/*.md -t "$pkgdir/usr/share/docs/dehydrated"

	install -Dm644 docs/examples/config "$pkgdir/etc/dehydrated/config.example"
	install -Dm644 docs/examples/domains.txt "$pkgdir/etc/dehydrated/domains.txt.example"
	install -Dm644 docs/examples/hook.sh "$pkgdir/etc/dehydrated/hook.sh.example"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
