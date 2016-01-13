# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=letsencrypt.sh-git
pkgver=r211.2a7b488
pkgrel=2
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

	install -Dm644 config.sh.example "$pkgdir/etc/letsencrypt.sh/config.sh.example"
	install -Dm644 domains.txt.example "$pkgdir/etc/letsencrypt.sh/domains.txt.example"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
