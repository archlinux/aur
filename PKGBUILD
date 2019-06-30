# Maintainer: Bruce Zhang
pkgname=dnscrypt-proxy-china-list-git
pkgver=74656.56e317e7e
pkgrel=1
pkgdesc="Chinese-specific configuration to improve your favorite DNS server. Best partner for chnroutes. (DNSCrypt Proxy Version)"
arch=('any')
url="https://github.com/felixonmars/dnsmasq-china-list"
license=('WTFPL')
depends=('dnscrypt-proxy')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('dnscrypt-proxy-china-list')
conflicts=('dnscrypt-proxy-china-list')
install=dnscrypt-proxy-china-list-git.install
source=('dnscrypt-proxy-china-list::git://github.com/felixonmars/dnsmasq-china-list.git')
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/dnscrypt-proxy-china-list"

	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/dnscrypt-proxy-china-list"

	DEDICATED_SERVER='223.5.5.5'
	make SERVER="$DEDICATED_SERVER" dnscrypt-proxy
}

package() {
	cd "$srcdir/dnscrypt-proxy-china-list"

	install -Dm644 dnscrypt-proxy-forwarding-rules.txt "$pkgdir/etc/dnscrypt-proxy/chinalist.txt"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dnscrypt-proxy-china-list-git/LICENSE"
}
