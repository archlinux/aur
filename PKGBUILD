# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.2.3
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('xrdp')
makedepends=('git' 'nasm' 'xorg-server-devel')
options=(!emptydirs)
source=("git+https://github.com/neutrinolabs/xorgxrdp.git")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	git checkout master
	./bootstrap
	./configure
	make
}

package() {
	cd ${_gitname}
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
