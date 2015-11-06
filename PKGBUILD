# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=snb-git
pkgver=029d3e8
pkgrel=1
pkgdesc="A simple Unicode-aware hierarchical notebook."
arch=("i686" "x86_64")
url="https://github.com/drbig/snb"
license=('custom:BSD')
depends=('ncurses')
makedepends=('git')
source=("${pkgname}::git+https://github.com/drbig/snb.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --always --dirty --match "[0-9A-Z]*.[0-9A-Z]*"
}

prepare() {
	cd "$pkgname"

	# Open the help file by default if no arguments are specified.
	sed -i src/user.h -e 's/\/\/#define DEFAULT_FILE.*/#define DEFAULT_FILE    "\/usr\/share\/docs\/snb\/help.md"/'
}

build() {
	cd "$pkgname"
	make NCURS_CONF=ncursesw6-config debug
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 help.md "${pkgdir}/usr/share/docs/snb/help.md"
	install -Dm755 bin/snb "${pkgdir}/usr/bin/snb"
}
