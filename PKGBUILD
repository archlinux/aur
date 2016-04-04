# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=letsencrypt.sh-git
pkgver=v0.1.0.r9.g33f07fc
pkgrel=1
pkgdesc="A Let's Encrypt (ACME) client implemented in bash"
arch=(any)
url="https://github.com/lukas2511/letsencrypt.sh"
license=('MIT')
source=("$pkgname::git+https://github.com/lukas2511/letsencrypt.sh.git")
depends=('curl' 'openssl')
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname"
	install -Dm755 letsencrypt.sh "$pkgdir/usr/bin/letsencrypt.sh"

	install -Dm644 docs/examples/config.sh.example "$pkgdir/etc/letsencrypt.sh/config.sh.example"
	install -Dm644 docs/examples/domains.txt.example "$pkgdir/etc/letsencrypt.sh/domains.txt.example"
	install -Dm644 docs/examples/hook.txt.example "$pkgdir/etc/letsencrypt.sh/hook.txt.example"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
