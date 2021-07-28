# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: graysky <graysky AT archlinux dot us>

pkgname=modprobed-db-git
_pkgname=modprobed-db
pkgver=2.44.0.g8e0e3c9
pkgrel=1
pkgdesc='Keeps track of EVERY kernel module ever used - useful for those of us who make localmodconfig :)'
arch=('any')
license=('MIT')
depends=('kmod')
makedepends=('git')
optdepends=('sudo')
provides=('modprobed-db')
conflicts=('modprobed-db')
url="https://wiki.archlinux.org/index.php/Modprobed-db"
source=("git://github.com/graysky2/modprobed-db")
sha256sums=('SKIP')
install=readme.install

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}            


build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
