#!/hint/bash
# Maintainer : SFN

pkgname=channel
pkgver=0.4.1
pkgrel=1
pkgdesc="Input for river"
arch=('x86_64')
url="https://codeberg.org/sivecano/channel"
license=('GPL3')
depends=('libwayland-client.so' 'libxkbcommon' 'river' 'glibc')
makedepends=('zig' 'git')
source=(
"$pkgname::git+${url}.git#tag=${pkgver}"
)
sha256sums=('90987fc145894e4353f3a8549818f4518e2d4cd86b8d361f5548cebb2d876b46')

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
