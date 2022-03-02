# Maintainer: DanielNak <daniel@tee.cat>
# Project author: Jean Guyomarch <jean@guyomarch.bzh>

_author=jeanguyomarch
pkgname=eovim
pkgver=0.2.0
pkgrel=2
pkgdesc="Eovim is the Enlightened Neovim. That's just an EFL GUI client for Neovim."
arch=('any')
url="https://phab.enlightenment.org/w/projects/eovim/"
license=('MIT')
depends=('efl' 'msgpack-c' 'neovim')
makedepends=('cmake' 'python')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_author/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d11da1d3736e19af4d6f7f97a382893fcfa0eba58f7137290e7c8a1ce802f53e')

build() {
	cd "$pkgname-$pkgver"
	cmake \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DLIB_INSTALL_DIR=/usr/lib \
	.
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
