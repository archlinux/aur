# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=usockets
pkgname=usockets
pkgver=0.8.5
pkgrel=4
pkgdesc="Miniscule cross-platform eventing, networking & crypto for async applications"
url="https://github.com/uNetworking/uSockets"
license=('Apache')
arch=('x86_64')
source=("https://github.com/uNetworking/uSockets/archive/refs/tags/v${pkgver}.tar.gz"
        "usockets-$pkgver-Makefile.patch")
sha256sums=('c52c98b7ff2c24534c17ad97d5fea8ca0cb7ff38cc933b8d08bac6e498a2ea6b'
            'efeac07919bc804d24b10eceaa2145e8cfa5f2e95edec9e47a94bba5a825b55b')
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
