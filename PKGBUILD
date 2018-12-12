# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.2.9
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("https://github.com/neutrinolabs/$_gitname/releases/download/v${pkgver}/$_gitname-${pkgver}.tar.gz")
sha256sums=('2f24f468771c874d6cda86e09edcf5bd48e88894de9c4ebd2bef9cb6f255c688')

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
