# Maintainer: shulhan <ms@kilabit.info>
pkgname=rescached-git
pkgver=2.0.0rc1
_pkgver=2.0.0rc1
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/shuLhan/rescached-go"
license=('custom:BSD')

depends=('bash')
provides=('rescached')
conflicts=('bind' 'nsd' 'pdnsd' 'powerdns' 'unbound' 'dnsmasq')

makedepends=('git' 'go-pie>=1.11' 'asciidoc')
source=(
	"$pkgname::git+https://github.com/shuLhan/rescached-go.git"
)
sha1sums=(
	'SKIP'
)

install=rescached-git.install
backup=(
	'etc/rescached/rescached.cfg'
	'etc/rescached/hosts.d/hosts.block'
)

pkgver() {
	cd "$pkgname"
	printf "%s.%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	echo ">>"
	echo ">> cleaning ..."
	echo ">>"
	make clean
	echo ">>"
	echo ">> make ..."
	echo ">>"
	make || return 1
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir" install
	install -Dm644 $srcdir/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
