# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite-git
_pkgname=dqlite
pkgver=1.11.1.r17.gda62ece
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/canonical/dqlite"
license=('LGPL3')
depends=('libuv>=1.8.0' 'sqlite' 'raft')
makedepends=('git')
source=("git+https://github.com/canonical/dqlite.git")
sha256sums=('SKIP')
conflicts=('dqlite')
provides=('dqlite')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
