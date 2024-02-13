# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=usockets
pkgname=usockets
pkgver=0.8.8
pkgrel=1
pkgdesc="Miniscule cross-platform eventing, networking & crypto for async applications"
url="https://github.com/uNetworking/uSockets"
license=('Apache')
arch=('x86_64')
source=("https://github.com/uNetworking/uSockets/archive/refs/tags/v${pkgver}.tar.gz"
        "usockets-$pkgver-Makefile.patch")
sha256sums=('d14d2efe1df767dbebfb8d6f5b52aa952faf66b30c822fbe464debaa0c5c0b17'
            'a10d858c209b34304b7301faa9aea6885c7300f643038f7d356451600c2be4c4')
depends=( openssl )

prepare() {
	cd "uSockets-$pkgver"
	patch < "$srcdir/usockets-$pkgver-Makefile.patch"
}

build() {
	cd "uSockets-$pkgver"
	make VERSION="$pkgver" WITH_OPENSSL=1 default
}

package() {
	cd "uSockets-$pkgver"
	make VERSION="$pkgver" DESTDIR="$pkgdir/" install
}

#vim: syntax=sh
