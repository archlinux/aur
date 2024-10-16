_pkgname=jqjq
pkgname=$_pkgname-git
pkgver=r189.15c9d86
pkgrel=1
pkgdesc="jq implementation of jq"
arch=(any)
url=https://github.com/wader/$_pkgname
license=(GPL3)
depends=(jq)
provides=(jqjq)
conflicts=(jqjq)
makedepends=(git)
source=("git+$url#tag=15c9d864a4b5154c1e1f7a1663ed19eed7636dfd")
sha256sums=('988e0b31cc3dff583eaa949046e0ce3776cde3cd4426a1ec4fcf83ac3bbaf98f')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	install -D "$_pkgname.jq" -t "$pkgdir/usr/lib/jq"
	sed -i 's|JQJQ_PATH=.*|JQJQ_PATH=/usr/lib/jq|' "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
