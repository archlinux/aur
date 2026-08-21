# Maintainer: catcraft

pkgname=harmony-im
pkgver=0.4.0
pkgrel=1
pkgdesc="An extensible [matrix] client."
arch=(any)
url="https://codeberg.org/catcraft/harmony"
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=('pnpm' 'git')
source=(
	"harmony::git+https://codeberg.org/catcraft/harmony.git#tag=v${pkgver}"
	"harmony-im.sh"
	"harmony-im.desktop"
)
sha256sums=(
	'94d001edf756dd74410ba76118e646e3daf89745daa6c89dfabc86e3f073ef25'
	'b7d645b78914197fa4b5d47d98f25ec570fd52d4e1fea2e39b6057fac2794857'
	'3ecb6bf1ad06373bfbaad033d46a447c1fad76785afa2f0587fccef9524a01a3'
)

build() {
	cd "$srcdir/harmony"
	pnpm i --frozen-lockfile
	pnpm run package
}

package() {
	cd "$srcdir"
	install -DTm=644 harmony/out/harmony-linux-*/resources/app.asar "$pkgdir/usr/lib/harmony-im/app.asar"
	install -DTm=644 harmony/assets/harmony-logo.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/harmony-im.png"
	install -DTm=644 harmony/assets/harmony-logo.png "$pkgdir/usr/share/pixmaps/harmony-im.png"
	install -DTm=644 harmony/assets/harmony-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/harmony-im.svg"
	install -DTm=755 ../harmony-im.sh "$pkgdir/usr/bin/harmony-im"
	install -DTm=755 ../harmony-im.desktop "$pkgdir/usr/share/applications/harmony-im.desktop"
}
