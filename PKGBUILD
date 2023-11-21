# Maintainer: 4679kun <admin@libnull.com>

pkgname=zroxy-git
_pkgname=zroxy
pkgver=r109.0e73503
pkgrel=2
pkgdesc="Transparent TLS sni proxy ( sniproxy ) written with pure C."
arch=(i686 x86_64)
url="https://github.com/0x7a657573/zroxy"
license=(GPLv3)
depends=(glibc)
makedepends=(make cmake gcc)
source=($_pkgname::git+https://github.com/0x7a657573/zroxy.git
		zroxy.service)
sha256sums=('SKIP'
            '47857f7cf3aa00641ada94584b42a4f1aeecd63b00edf6f3cd259abf1b2ac08a')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g'
  )
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	install -Dm0755 $srcdir/$_pkgname/build/zroxy $pkgdir/usr/bin/zroxy
	install -Dm0644 $srcdir/zroxy.service $pkgdir/usr/lib/systemd/system/zroxy.service
}

