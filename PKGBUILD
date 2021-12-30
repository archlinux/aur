# Maintainer: Ranadeep B < mail at rnbguy dot at >

_basename=sentinel
_pkgname=${_basename}-client-cli
pkgname=${_pkgname}-git
pkgver=0.2.0.rc0.r1.g83beda2
pkgrel=1
pkgdesc="The official Sentinel CLI client"
arch=('x86_64')
url="https://github.com/${_basename}-official/cli-client"
license=('Apache')
provides=("${_basename}cli")
depends=(
	'openresolv'
	'wireguard-tools'
)
makedepends=(
	'go'
	'make'
)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

package() {
	cd "$srcdir/$_pkgname"
	install -DT build/${_basename}cli-*-linux-amd64 "$pkgdir/usr/local/bin/${_basename}cli"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
