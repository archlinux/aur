# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=run0-sudo
pkgver=1.1.0
pkgrel=1
pkgdesc='A tiny sudo-compatibility shim backed by run0'
arch=('x86_64')
url='https://codeberg.org/nathawat/run0-sudo-shim'
license=('GPL-3.0-or-later')
depends=('systemd>=256')
makedepends=('zig>=0.16.0')
provides=('sudo')
conflicts=('sudo')
_repo='run0-sudo-shim'
_tag="v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz")
b2sums=('666c7f8c2b2cf910d95a197ce32ae2f45471e5704811eab03e29a67c25e0074ba1a70f53c1b932337195dfd61b2b48ff2fffea5c853b14d88948a6669557ee1e')

build() {
	cd "$srcdir/$_repo"
	zig build --release=fast
}

check() {
	cd "$srcdir/$_repo"
	zig build test
}

package() {
	cd "$srcdir/$_repo"

	install -Dm755 'zig-out/bin/run0-sudo' "$pkgdir/usr/bin/sudo"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
