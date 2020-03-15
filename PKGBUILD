# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.2.13
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("https://github.com/neutrinolabs/$_gitname/releases/download/v${pkgver}/$_gitname-${pkgver}.tar.gz")
sha256sums=('3116fffc22ad0ca95972710ff5cb378d600cf1006bd7f990eb759bc015f4a840')

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
