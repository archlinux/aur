# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.9.19
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("https://github.com/neutrinolabs/$_gitname/releases/download/v${pkgver}/$_gitname-${pkgver}.tar.gz")
sha256sums=('c1cf4c583c28a24ce814c147d387b8f4d255877f2e365372c69c6f076ddb1455')

build() {
	cd "${_gitname}-${pkgver}"
	./bootstrap
	./configure
	make
}

package() {
	cd "${_gitname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
