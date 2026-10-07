# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=godyl
pkgver=0.2.3
pkgrel=1
pkgdesc="Batch download, checksum-verify, and install static binaries from GitHub/GitLab releases"
arch=('x86_64')
url="https://github.com/idelchi/godyl"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.2.3"
_srcdir="godyl-0.2.3"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/idelchi/godyl/tar.gz/refs/tags/$_tag")
sha256sums=('80e8af3316a8bd38126e6d47704a66e5b25c2ff3c1d6e5015756df95a1017b64')

build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	go build -o godyl .
}

package() {
	cd "$_srcdir"
	install -Dm755 godyl "$pkgdir/usr/bin/godyl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -d "$pkgdir/usr/share/doc/$pkgname/docs"
	cp -r docs/. "$pkgdir/usr/share/doc/$pkgname/docs/"
	install -d "$pkgdir/usr/share/$pkgname"
	install -Dm644 defaults.yml "$pkgdir/usr/share/$pkgname/defaults.yml"
	install -Dm644 godyl.yml "$pkgdir/usr/share/$pkgname/godyl.yml"
	install -Dm644 tools.yml "$pkgdir/usr/share/$pkgname/tools.yml"
}
