# Maintainer: 4679kun <admin@libnull.com>

pkgname=zroxy-git
_pkgname=zroxy
pkgver=r109.0e73503
pkgrel=1
pkgdesc="Transparent TLS sni proxy ( sniproxy ) written with pure C."
arch=(i686 x86_64)
url="https://github.com/0x7a657573/zroxy"
license=(GPLv3)
depends=(glibc)
makedepends=(make cmake gcc)
source=($_pkgname::git+https://github.com/0x7a657573/zroxy.git
		zroxy.service)
sha256sums=('SKIP'
            '2df5bf623ff55a47b2f9259eb44a137f8206d6e897c2504bccb70d50fc5e5dcd')

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

