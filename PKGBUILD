# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=fpga-interchange-schema
pkgname="$_pkgname-git"
pkgver=r22.cb6d168
pkgrel=2
pkgdesc="FPGA interchange schema definitions"
arch=(any)
url="https://github.com/SymbiFlow/fpga-interchange-schema"
license=('Apache')
depends=('capnproto-java')
makedepends=('git')
checkdepends=()
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=(
	"git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	#git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"

	install -Dm644 -t "$pkgdir/usr/share/$_pkgname/" interchange/*.capnp
}
