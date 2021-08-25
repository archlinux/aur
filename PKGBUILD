# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=dehydrated-cloudflare-hook
pkgver=r80.de5af98
pkgrel=1
pkgdesc="CloudFlare hook for dehydrated"
arch=(any)
url="https://github.com/walcony/letsencrypt-cloudflare-hook"
license=('MIT')
source=("git+https://github.com/walcony/letsencrypt-cloudflare-hook.git")
depends=('dehydrated' 'python' 'python-dnspython' 'python-future' 'python-requests' 'python-six' 'python-tld')
makedepends=('git')
sha256sums=('SKIP')
pkgver() {
  cd letsencrypt-cloudflare-hook
  (set -o pipefail
   git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
	cd letsencrypt-cloudflare-hook
	install -Dm755 "hook.py" "$pkgdir/etc/dehydrated/hooks/letsencrypt-cloudflare-hook.py"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

