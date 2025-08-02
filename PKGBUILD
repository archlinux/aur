# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=(domake
	 domake-docker-make
	 domake-linux-amd64
	 domake-linux-arm64
	 domake-linux-arm
	 domake-linux-ppc64le
	 domake-linux-riscv64
	 domake-linux-s390x)
pkgver=3
pkgrel=1
pkgdesc='Docker make'
arch=(any)
url=https://github.com/gportay/domake
license=(LGPL-2.1-or-later)
depends=(bash)
makedepends=(asciidoctor bash-completion)
checkdepends=(shellcheck)
source=("domake-$pkgver.tar.gz::https://github.com/gportay/domake/archive/$pkgver.tar.gz")
sha256sums=('eabcf53d059aa390931c3a45d685dbc4ed121d8a8ff97493c1cf554734726343')
validpgpkeys=(8F3491E60E62695ED780AC672FA122CA0501CA71)

build() {
	cd "domake-$pkgver"
	make domake.1.gz
}

check() {
	cd "domake-$pkgver"
	make -k check
}

package_domake() {
	depends+=(dosh)
	optdepends+=(domake-docker-make)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-doc install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake/LICENSE"
}

package_domake-docker-make() {
	pkgdesc='Docker CLI plugin for domake'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-docker-cli-plugin
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-docker-make/LICENSE"
}

package_domake-linux-amd64() {
	pkgdesc='Docker shell for linux/amd64 platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-amd64-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-amd64/LICENSE"
}

package_domake-linux-arm64() {
	pkgdesc='Docker shell for linux/arm64 platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-arm64-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-arm64/LICENSE"
}

package_domake-linux-arm() {
	pkgdesc='Docker shell for linux/arm platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-arm-domake install-linux-arm-v6-domake install-linux-arm-v7-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-arm/LICENSE"
}

package_domake-linux-ppc64le() {
	pkgdesc='Docker shell for linux/ppc64le platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-ppc64le-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-ppc64le/LICENSE"
}

package_domake-linux-riscv64() {
	pkgdesc='Docker shell for linux/riscv64 platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-riscv64-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-riscv64/LICENSE"
}

package_domake-linux-s390x() {
	pkgdesc='Docker shell for linux/s390x platform'
	depends+=(domake)

	cd "domake-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-s390x-domake
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/domake-linux-s390x/LICENSE"
}
