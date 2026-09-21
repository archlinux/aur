# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=hardv
pkgver=5.0.0_alpha.2
pkgrel=1
pkgdesc="A CLI flashcard app for UNIX-compatible systems, conforming to the UNIX philosophy"
arch=('x86_64')
url="https://github.com/dongyx/hardv"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
_tag="v5.0.0-alpha.2"
_srcdir="hardv-5.0.0-alpha.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/dongyx/hardv/tar.gz/refs/tags/$_tag")
sha256sums=('4e4f4816a3793b18e276aa747d6f2406aa621f62017d1120ec077c6ee25f1493')
function build() {
	cd "$_srcdir"
	export CFLAGS="${CFLAGS} -D_XOPEN_SOURCE=700"
	make prefix=/usr
}
function package() {
	cd "$_srcdir"
	mkdir -p "$pkgdir/usr/share/man/man1"
	make prefix=/usr DESTDIR="$pkgdir" install
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
