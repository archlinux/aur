# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.2.18
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("https://github.com/neutrinolabs/$_gitname/releases/download/v${pkgver}/$_gitname-${pkgver}.tar.gz")
sha256sums=('45df8934dfc39e97a5d8722859b82186d2dfd0a4f80c92a6f7771bd85baed93c')

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
