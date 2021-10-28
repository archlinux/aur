# Contributor: Woshiluo Luo <woshiluo.luo@outlook.com>

pkgname=unbound-china-list-git
pkgver=0.130735.227b400e59
pkgrel=1
pkgdesc="Configuration for hot China domains to accelerate via Unbound"
arch=('any')
url="https://github.com/felixonmars/dnsmasq-china-list"
license=('WTFPL')
depends=('unbound')
makedepends=('git')
source=("git+https://github.com/felixonmars/dnsmasq-china-list.git")
md5sums=('SKIP')

pkgver() {
	cd dnsmasq-china-list
	echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd dnsmasq-china-list
	make unbound SERVER="223.5.5.5@853#dns.alidns.com\n  forward-tls-upstream: yes" 
}

package() {
	install -Dm644 dnsmasq-china-list/accelerated-domains.china.unbound.conf "$pkgdir/etc/unbound/china-list/accelerated-domains.china.unbound.conf"
	install -Dm644 dnsmasq-china-list/apple.china.unbound.conf "$pkgdir/etc/unbound/china-list/apple.china.unbound.conf"
	install -Dm644 dnsmasq-china-list/google.china.unbound.conf "$pkgdir/etc/unbound/china-list/google.china.unbound.conf"
}
