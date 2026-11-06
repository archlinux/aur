#!/hint/bash
# Maintainer : SFN

pkgname=channel
pkgver=0.5.2
pkgrel=1
pkgdesc="An input manager for the river compositor"
arch=('x86_64')
url="https://codeberg.org/sivecano/channel"
license=('GPL3')
depends=('libwayland-client.so' 'libxkbcommon' 'river' 'glibc')
makedepends=('zig' 'git')
source=(
"$pkgname::git+${url}.git#tag=${pkgver}"
)
sha256sums=('5572e77fc1fef4ff5d6081428a7ccde44f73ba2c1acb747a1c6dbf8613c5575b')

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
