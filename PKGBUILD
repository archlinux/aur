# Maintainer: DanManN <dnahimov@gmail.com>
# Project author: Jean Guyomarch <jean@guyomarch.bzh>

_author=jeanguyomarch
pkgname=eovim
pkgver=0.1.3
pkgrel=1
pkgdesc="Eovim is the Enlightened Neovim. That's just an EFL GUI client for Neovim."
arch=('any')
url="https://phab.enlightenment.org/w/projects/eovim/"
license=('MIT')
depends=('efl' 'msgpack-c' 'neovim')
makedepends=('cmake' 'python' 'python-jinja')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_author/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('765f4716b2573e547ad11300957cb27fbe29cc7e288f611953a3d10566524bae')

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
