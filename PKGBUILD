# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.2.15
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("https://github.com/neutrinolabs/$_gitname/releases/download/v${pkgver}/$_gitname-${pkgver}.tar.gz")
sha256sums=('fde7ba96b6fc34ffdeaef9fc5a86c7f1f21cf82efd9df005f206f2d25b2afa37')

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
