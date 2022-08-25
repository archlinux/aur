# Maintainer: Riccardo Paolo Bestetti <pbl@bestov.io>
pkgname=yakpro-po-git
pkgver=r206.b6e2f98
pkgrel=1
pkgdesc='It simply aims to be the best obfuscation tool for php.'
arch=('any')
url='https://www.php-obfuscator.com/'
license=('MIT')
groups=()
depends=('php7')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=yakpro-po-git.install
changelog=
source=('source::git+https://github.com/pk-fr/yakpro-po.git')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "source"

	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "source"
	sed -i -e '1 s/^.*$/#!\/usr\/bin\/env php7/' yakpro-po.php
	git clone https://github.com/nikic/PHP-Parser.git --branch 4.x
	chmod +x yakpro-po.php
}

package() {
	cd "source"

	mkdir -p "$pkgdir/opt/yakpro-po/"
	mkdir -p "$pkgdir/usr/local/bin/"
	cp -r * "$pkgdir/opt/yakpro-po/"
	ln -s /opt/yakpro-po/yakpro-po.php "$pkgdir/usr/local/bin/yakpro-po"
}

