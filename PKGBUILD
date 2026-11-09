#!/hint/bash
# Maintainer : SFN

pkgname=channel
pkgver=0.5.2
pkgrel=2
pkgdesc="An input manager for the river compositor"
arch=('x86_64')
url="https://codeberg.org/sivecano/channel"
license=('GPL3')
depends=('libwayland-client.so' 'libxkbcommon' 'river' 'glibc')
makedepends=('zig' 'git')
source=(
"$pkgname::git+${url}.git#tag=${pkgver}"
)
sha256sums=('b6fe29077350edfd1de7932ca5f83b04a9d0ae8c4e583825b43ed1346b85be97')

build() {
	cd $pkgname
	# add target and -Dcpu=baseline if building for others
	DESTDIR="build" zig build \
	--summary all \
	--prefix /usr \
	--search-prefix /usr \
	-Doptimize=ReleaseSafe
}

package() {
	cd $pkgname

	cp -a build/* "$pkgdir"

	install -Dm644 README.asciidoc -t "$pkgdir/usr/share/$pkgname"
	install -Dm644 config.rh -t "$pkgdir/usr/share/$pkgname"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ts=8:
