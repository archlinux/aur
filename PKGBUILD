# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=teetail-git
pkgver=r11.5237d11
pkgrel=1
pkgdesc="Like tee, but only the tail goes in the file"
arch=('x86_64' 'aarch64')
url="https://github.com/sl236/teetail"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('gcc' 'git')
provides=('teetail')
conflicts=('teetail')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd teetail
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd teetail
	gcc $CFLAGS $CPPFLAGS $LDFLAGS teetail.c -o teetail
}

package() {
	cd teetail
	install -Dm755 teetail "$pkgdir/usr/bin/teetail"
	install -Dm644 README.md "$pkgdir/usr/share/doc/teetail/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
